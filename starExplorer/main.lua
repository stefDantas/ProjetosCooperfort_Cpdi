local physics = require ("physics")
physics.start ()
physics.setGravity (0, 0)
physics.setDrawMode ("hybrid")

display.setStatusBar (display.HiddenStatusBar)

local spriteOpcoes = 
{
    frames=
    {
        { --1) Asteroide 1
            x=0,
            y=0,
            width=102,
            height=85
        },
        { --2) Asteroide 2
            x=0,
            y=85,
            width=90,
            height=83
        },
        { --3) Asteroide 3
            x=0,
            y=168,
            width=100,
            height=97
        },
        { --4) Nave
            x=0,
            y=265,
            width=98,
            height=79
        },
        { --5) Laser
            x=98,
            y=265,
            width=14,
            height=40
        }
    }
}

local sprite = graphics.newImageSheet ("imagens/sprite.png", spriteOpcoes)

local backGroup = display.newGroup ()
local mainGroup = display.newGroup ()
local UIGroup = display.newGroup ()


local bg = display.newImageRect (backGroup,"imagens/bg.png", 800, 1400)
bg.x = display.contentCenterX
bg.y = display.contentCenterY

local nave = display.newImageRect (mainGroup, sprite, 4, 98, 79)
nave.x = display.contentCenterX
nave.y = display.contentHeight - 100 -- limite da altura do telefone (-100 pra fica 100 pixels pra cima), adapta em qualquer telefone
physics.addBody (nave, "dynamic", {radius=30, isSensor=true})
--isSensor para que colida e não sofra o efeito rebote
nave.myName = "Nave"

local vidas = 3
local pontos = 0
local asteroidesTable = {}
-- Para que o jogo comece Aleatório: um comando do matth.random que garante o aleatório
math.randomseed (os.time()) -- Faz com que os math.randoms não tenham um padrão possível. (os.time, equanto o sistema do jogo estiver rodando)
local gameLoopTimer
local morto = false

local vidasText = display.newText (UIGroup, "Vidas: ".. vidas, display.contentCenterX-150, display.contentHeight/2*0.1, native.systemFont, 36)
local pontosText = display.newText (UIGroup, "Pontos: " .. pontos, display.contentCenterX+30, display.contentHeight/2*0.1, native.systemFont, 36)

local function criarAsteroide ()
    local novoAsteroide = display.newImageRect (mainGroup, sprite, 1, 102, 85)
    -- Incluindo o asteroide na tabela
    table.insert (asteroidesTable, novoAsteroide)
    physics.addBody (novoAsteroide, "dynamic", {radius=40, bounce=0.8})
    novoAsteroide.myName = "Asteroide"

    local localizacao = math.random (3)

    if (localizacao == 1) then
        novoAsteroide.x = - 60
        novoAsteroide.y = math.random (500)
        novoAsteroide:setLinearVelocity (math.random(40, 120), math.random(20, 60))

    elseif (localizacao == 2) then
        novoAsteroide.x = math.random(display.contentWidth)
        novoAsteroide.y = - 60
        novoAsteroide:setLinearVelocity (math.random (-40, 40), math.random (40,120))

    elseif (localizacao == 3) then
        novoAsteroide.x = display.contentWidth + 60
        novoAsteroide.y = math.random (500)
        novoAsteroide:setLinearVelocity (math.random (-120, -40), math.random (20, 60))
    end

    novoAsteroide:applyTorque (math.random (-6, 6))

end

-- isSensor : detectar as colisões, mas não terá nenhum tipo de retorno físico, ou seja não terá nenhuma reação visual de colisão. 

-- Bullet: terá uma detecção de colisão continua, para que não se perca nenhum "tiro". 
local function atirar ()
    local laser = display.newImageRect (mainGroup, sprite, 5, 14, 40)
    physics.addBody (laser, "dynamic", {isSensor=true})
    laser.isBullet = true
    laser.myName = "Laser"
    laser.x, laser.y = nave.x, nave.y
    laser:toBack ()

    transition.to (laser, {y=-40, time=500, oncomplete = function() display.remove(laser) end})

end

nave:addEventListener ("tap", atirar)

local function moverNave (event)
    
    local nave = event.target
    local phase = event.phase
    if ("began" == phase) then
    -- Define nave como foco de toque.
        display.currentStage:setFocus (nave)
        nave.touchOffsetX = event.x - nave.x
    elseif ("moved" == phase) then
    -- A cada fim de toque a localização inicial muda.
        nave.x = event.x - nave.touchOffsetX
    elseif ("ended" == phase or "cancelled" == phase) then
        display.currentStage:setFocus (nil)
    end

    return true
end

nave:addEventListener ("touch", moverNave)

-- Garatir que os asteróides fora da tela/ ou que o usuário não coniga eliminar sejam eliminados para que o jogo não pese.
local function gameLoop ()
    criarAsteroide()
        -- Removendo o asteroide, grupo (ex. #asteroidesTable = 10 e , 1 inicio e -1  menos um ate 1), sem inicio 1 daria errado poisia ate 0 ou -1.
        for i = #asteroidesTable, 1, -1 do -- # tamanho da tabela
            local thisAsteroide = asteroidesTable [i]
        -- Quando o asteroide estiver fora da tela em tantos pixels ele some
            if (thisAsteroide.x < -100 or thisAsteroide.x > display.contentWidth + 100 or thisAsteroide.y < -100 or thisAsteroide.y > display.contentHeight) then
                display.remove (thisAsteroide)
                table.remove (asteroidesTable, i)
            end
        end
end

gameLoopTimer = timer.performWithDelay (700, gameLoop, 0)

local function restauraNave ()
    nave.isBodyActive = false
    nave.x = display.contentCenterX
    nave.y = display.contentHeight - 100

    transition.to (nave, {alpha=1, time=4000, onComplete = function()
                                                nave.isBodyActive=true 
                                                morto=false
                                                end})
end

local function onCollision (event)
    if (event.phase == "began") then
        local obj1 = event.object1
        local obj2 = event.object2

        if((obj1.myName == "Laser" and obj2.myName == "Asteroide") or
            (obj1.myName == "Asteroide" and obj2.myName == "Laser")) then
            display.remove (obj1)
            display.remove (obj2)
            -- Mesmo esquema da tabela acima, remover o que há dentro da tabela, i
            for i = #asteroidesTable, 1, -1 do
                if (asteroidesTable[i] == obj1 or asteroidesTable[i] == obj2) then
                    table.remove (asteroidesTable, i)
                    break -- Parar o comando para que não tire mais nenhum asteroide errado da tabela
                end -- if asteroidesTable
            end -- for
            pontos = pontos + 100
            pontosText.text = "Pontos: " .. pontos

        elseif ((obj1.myName == "Nave" and obj2.myName == "Asteroide") or
            (obj1.myName == "Asteroide" and obj2.myName == "Nave")) then
            if (morto == false) then
                morto = true
                    vidas = vidas - 1
                    vidasText.text = "Vidas: " .. vidas

                    if (vidas == 0) then
                        display.remove (nave)
                    else
                        nave.alpha = 0

            timer.performWithDelay (1000, restauraNave)
                    end -- if Vidas
            end -- if morto
        end -- if myName
    end -- if event.phase
end -- function

Runtime:addEventListener ("collision", onCollision)
