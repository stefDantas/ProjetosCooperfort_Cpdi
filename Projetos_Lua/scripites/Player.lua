-- chamar o scripite/bibliotéca do teclado
local scriptTeclado = require ("Teclado")

local Player = {}
-- hud está ligado a váriavel criada no mais que executa a função .novo no scipit HUD
function Player.novo (x, y, hud)
    local spritePlayer = graphics.newImageSheet ("imagens/player.png", {width=90, height=95, numFrames=12})

    local playerAnimacao = 
        {
            {name="parado", start=1, count=3, time=300, loopCount=0},
            {name="correndo", start=5, count=8, time=1000, loopCount=0}
        }

    local player = display.newSprite (spritePlayer, playerAnimacao)
    player.x = x
    player.y = y
    player.id = "player" -- Utilizado na função de colisão local
    player.direcao = "parado"
    player:setSequence ("parado")
    player:play()
    player.numeroPulo = 0
    physics.addBody(player, "dynamic", {friction=1, box={x=0, y=0, halfWidth=30, halfHeight=40, angle=0}})
    player.isFixedRotation = true -- Para que o player não tombe no jogo após o 360 (descer do pulo)
    
    -- ativando a função global .novo do script do teclado
    scriptTeclado.novo (player)
    
    -- Colisão local (de um para muitos)
    -- self: colisao pessoa/principal, no caso player
    local function verificarColisao (self, event)
        if event.phase == "began" then
            -- quando o id do outro corpo for "chão"
            if event.other.id == "chao" then
                -- zeramos a variável numPulos do player para impedir o pulo duplo no chão
                self.numeroPulo = 0
            elseif event.other.id == "inimigo" then 
                -- Criamos a variavel topoInimigo para definir a localização do topo do inimigo.
                local topoInimigo = event.other.y - (event.other.height/2)
                -- Se a localização do player for a mesma do topo do inimigo então
                if self.y <= topoInimigo then 
                    -- remove inimigo
                    display.remove (event.other)
                    -- Velocidade linear ao player -300 no y, para que ele suba(poderia ser impulso)
                    self:setLinearVelocity(0, -300)
                end -- fecha o if self
            elseif event.other.id == "moeda" then
                display.remove (event.other)
                hud.somar() -- executa função do sript HUD para somar os pontos
            end 
        end
    end

    player.collision = verificarColisao
    player:addEventListener ("collision")

    return player -- personagem

end
return Player -- script

-- return finaliza as propagação das informações. arremate.