-- chamar a biblioteca de fisica
local physics = require ("physics")
-- Iniciar o motor de física
physics.start()
-- Definir a gravidade
physics.setGravity (0,0) -- se caso não definir, ficara o padrão da terra (0, 9.8)
--  Definir o modo de renderização
physics.setDrawMode ("normal")  

-- Remover a barra de notificações
display.setStatusBar (display.HiddenStatusBar)

-- Criar os grupos de exibição
local grupoBg = display.newGroup () -- Objetos decorativos, cenários (não tem interação)
local grupoMain = display.newGroup () -- Bloco principal (tudo que precisar interagir com o playes fica nesse grupo).
local grupoUI = display.newGroup () -- Interface do usuário (placares, botões...)

-- Audio BG
local bgAudio = audio.loadStream ("audio/bg.mp3")
audio.setVolume (0.6, {channel=1})
audio.reserveChannels (1) 
audio.play (bgAudio, {channel=1, loops=-1})
-- Audio Colisao/feitiço/tiro
local audioFeitico = audio.loadSound ("audio/feitico.mp3")
-- Audio gameOver
local audioGameOver = audio.loadSound ("audio/morreu.mp3")
-- Audio Dano no Mario
local audioDanoMario = audio.loadSound ("audio/danoMario.mp3")
local parametros = {time=2000, }


-- Criar variáveis de pontos para atribuição de valor
local pontos = 0
local vidas = 5

-- Adicionar background         (grupo,"pasta/nomeArq.formato", largura, altura)
local bg = display.newImageRect (grupoBg, "imagens/bg.jpg", 1005/2, 1005/2)
bg.x = display.contentCenterX
bg.y = display.contentCenterY

-- adicionar os placar na tela
-- (grupo de exibição, "texto" concatenamos com a variavel ponto, localizaçãoX, localizaçãoY, fonte, tamanho da fonte)
local pontosText = display.newText (grupoUI, "Pontos: " .. pontos, 100, 30, native.systemFont, 20)
pontosText:setFillColor (0, 0, 0)

local vidasText = display.newText (grupoUI, "Vidas: " .. vidas, 200, 30, native.systemFont, 20)
vidasText:setFillColor (0, 0, 0)

local ground = display.newImageRect (grupoMain,"imagens/ground.png", 1028/2, 256/2)
ground.x = display.contentCenterX
ground.y = 500

local player = display.newImageRect (grupoMain,"imagens/player.png", 1947/19, 1825/19)
player.x = 30
player.y = 370
player.myName = "Mario"
-- Adicionar corpo fisíco a imagem
physics.addBody (player, "kinematic") -- colide com o dinâmico e não tem interferência da gravidade.

-- Criar botões
local botaoCima = display.newImageRect (grupoMain,"imagens/button.png", 1280/40, 1279/40)
botaoCima.x = 300
botaoCima.y = 427
botaoCima.rotation = - 90 -- faz a rotação da imagem em x graus.

local botaoBaixo = display.newImageRect (grupoMain,"imagens/button.png", 1280/40, 1279/40)
botaoBaixo.x = 300
botaoBaixo.y = 465
botaoBaixo.rotation = 90

-- Adicionar funções de movimentação
local function cima()
    player.y = player.y - 10
end

local function baixo()
    player.y = player.y + 10
end

-- Adicionar o ouvinte e a função ao botão.
botaoCima:addEventListener ("tap", cima)
botaoBaixo:addEventListener ("tap", baixo)

-- Adicionar botão de tiro:
local botaoTiro = display.newCircle (grupoMain, 325, 445, 15)
botaoTiro: setFillColor (0,0,0)

-- Função para atirar:
local function atirar ()
    -- Toda vez que a função for executada cria-se um novo "tiro"
    local tiroPlayer = display.newImageRect (grupoMain, "imagens/tiro.png", 894/25, 634/25)
    -- a localização é a mesma do player
    tiroPlayer.x = player.x 
    tiroPlayer.y = player.y
    physics.addBody (tiroPlayer, "dynamic", {isSensor=true}) -- isSensor atribuindo ao objeto o sensor de arma/tiro, a detecção de colisão vai ser continua.
    transition.to (tiroPlayer, {x=500, time=900, -- vai até a posição x, em 900mls
                    onComplete = function () display.remove (tiroPlayer) -- onComplete (quando a transição anterior/principal se completar) acionamos um afunção temporária display.remove, que remove o tiro pra não pesar.
                    end})
    tiroPlayer.myName = "fogo"
    tiroPlayer:toBack () -- Jogando elemento para trás do grupo de exibição dele.

end

botaoTiro:addEventListener ("tap", atirar)

-- Adicionar inimigo
local inimigo = display.newImageRect (grupoMain, "imagens/inimigo.png", 1549/40, 1747/40)
inimigo.x = 270
inimigo.y = 370
inimigo.myName = "cogumelo"
physics.addBody (inimigo, "kinematic")
local direcaoInimigo = "cima"

-- Função para o inimigo atirar:
local function inimigoAtirar ()
    local tiroInimigo = display.newImageRect (grupoMain, "imagens/miniMigo.png", 411/20, 413/20)
    tiroInimigo.x = inimigo.x
    tiroInimigo.y = inimigo.y
    physics.addBody (tiroInimigo, "dynamic", {isSensor=true})
    transition.to (tiroInimigo, {x=-200, time=900,
                        onComplete = function() display.remove (tiroInimigo)
                        end})
    tiroInimigo.myName = "tiro"
end

-- Criando timer de disparo do inimigo
-- comandos timer: (tempo repetição, função, quantidade de repetição )
inimigo.timer = timer.performWithDelay (math.random (1000, 1500), inimigoAtirar , 0)

-- Movimentação do inimigo:
local function movimentarInimigo ()
-- se a localização X, não for igual a nulo então
    if not (inimigo.x == nil) then
-- Qaundo a direção do inimigo for cima então
        if (direcaoInimigo == "cima") then
            inimigo.y = inimigo.y -1
-- Se a localização y do inimigo for menor ou igual 
            if (inimigo.y <= 50) then 
                -- Altera a variável para "baixo"
                direcaoInimigo = "baixo"
            end -- if (inimigo.y .....)
-- Se a direção do inimigo for igual a baixo então
        elseif (direcaoInimigo == "baixo") then
            inimigo.y = inimigo.y +1
-- Se a localização y do inimigo for maior ou igual a 400 então
            if (inimigo.y >= 400) then
                direcaoInimigo = "cima"
            end -- if (inimigo.y .....)
        end -- if (direcaoInimigo)
-- Se não
    else
        print ("Inimigo morreu!")
-- Runtime: representa todo o jogo (evento é executado para todos), enterframe: está ligado ao valor de FPS do jogo (frames por segundo), no caso a função vai ser executada 60 vezes por segundo.
        Runtime:removeEventListener ("enterFrame", movimentarInimigo)
    end
end

Runtime:addEventListener ("enterFrame", movimentarInimigo)

-- Função de Colisão:
local function onCollision (event)
    
    if (event.phase == "began") then
-- Variáveis criadas para facilitar a escrita do código.  
        local obj1 = event.object1
        local obj2 = event.object2
-- Quando o myName do objeto 1 for .. e o nome do obj2 for .. 
        if ((obj1.myName == "fogo" and obj2.myName == "cogumelo") or (obj1.myName == "cogumelo" and obj2.myName == "fogo")) then
            audio.play (audioFeitico, parametros)
        -- Se o obj1 for ... then
            if (obj1.myName == "fogo") then
            --Adicionando o audio da colisão de "tiro"
            -- audio.play (audioFeitico, parametros)
            display.remove (obj1)
            
        -- Remove o projétil do jogo.
            else 
            display.remove (obj2)
            -- audio.play (audioFeitico, parametros)
            end
-- Somar 10 pontos a cada colisão.
            pontos = pontos +10
-- Atualiza os pontos na tela.
            pontosText.text = "Pontos: " .. pontos
-- Se o obj1 for Player e o 2 for projétil  do inimigo ou vice e versa então
        elseif ((obj1.myName == "Mario" and obj2.myName == "tiro") or (obj1.myName == "tiro" and obj2.myName == "Mario")) then

            if (obj1.myName == "tiro") then
            -- Adio dano no Mario
            audio.play (audioDanoMario, parametros)
            display.remove(obj1)

            else
            audio.play (audioDanoMario, parametros)
            display.remove(obj2)
            end
-- Reduz uma vida do player a cada colisão
        vidas = vidas -1
        vidasText.text = "Vidas: " .. vidas
            if (vidas <= 0) then
                audio.pause (bgAudio, parametros)
                audio.play (audioGameOver, parametros)
                Runtime:removeEventListener ("collision", onCollision)
                Runtime:removeEventListener ("enterFrame", movimentarInimigo)
                timer.pause (inimigo.timer) -- colocar sempre o nome que foi criado o timerWithDelay
                botaoBaixo:removeEventListener ("tap", baixo)
                botaoCima:removeEventListener ("tap", cima)
                botaoTiro:removeEventListener ("tap", atirar)

                local gameOver = display.newImageRect (grupoUI, "imagens/gameOver.png", 1000*0.5, 800*0.5)
                gameOver.x = display.contentCenterX
                gameOver.y = display.contentCenterY
            end

        end -- fecha o if myName
    
    end -- fecha o if event.phase
end -- fecha a function

Runtime:addEventListener("collision", onCollision)        