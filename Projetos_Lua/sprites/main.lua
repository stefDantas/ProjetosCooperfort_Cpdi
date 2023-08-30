display.setStatusBar (display.HiddenStatusBar)

-- Inclusão de spite animação
-- ("pasta/arquivo.formato", {larguraFrame=, alturaFrame=,  numeroFrames= })
local sprite1 = graphics.newImageSheet ("imagens/playerFem2.png", {width=192, height=256, numFrames=45})

-- Comandos de animação 
-- Adicionar uma string(tabela), para armazenar aos dados de animação para chamar no futuro
local sprite1Animacao = {
-- {nome="estágio da animação", frameInicial=, continuação=, tempo=, loopins=(0 é infinito)}
    {name="parado", start=1, count=1, time=1000, loopCount=0},
    {name="andando", start=37, count=8, time=1000, loopCount=0},
    {name="pulo", start=2, count=3, time=1000, loopCount=0},
    {name="derrapando", start=32, count=1, time=1000, loopCount=0},
    {name="derrapando1", start=33, count=1, time=3000, loopCount=0}
}

--newSprite é uttilizado apenas para as sprites de animação
local player = display.newSprite (sprite1, sprite1Animacao)
player.x = display.contentCenterX
player.y = display.contentCenterY

-- Nesse caso de animação não funciona só alterar a largura e a altura:
-- player.width = player.width*0.5
-- player.height = player.height*0.5

-- Usar o scale para redimencionar a imagem 
player.xScale = 0.3
player.yScale = 0.3
-- Definir sequencia de animação inicial
player:setSequence("parado")
-- Inicia a sequencia de animação
player:play ()

-----------------------------------------------------------------------------------

-- Sprite de elementos estáticos:
local spriteOpcoes =
{

    frames = 
    {
        { -- 1. Menu
            x = 0,
            y = 0,
            width = 125,
            height = 100
        },
        { -- 2. Botao Esquerda
        x = 0,
        y = 100,
        width = 125,
        height = 100
        },
        { -- 3. ON/OFF
        x = 0,
        y = 200,
        width = 125,
        height = 100
        },
        { -- 4. Configuração
        x = 0,
        y = 300,
        width = 125,
        height = 100
        },
        { -- 5. Mensagem
        x = 0,
        y = 400,
        width = 125,
        height = 100
        },
        { -- 6. Pause
        x = 125,
        y = 0,
        width = 125,
        height = 100
        },
        { -- 7. Botão Direita
        x = 125,
        y = 100,
        width = 125,
        height = 100
        },
        { -- 8. Return
        x = 125,
        y = 200,
        width = 125,
        height = 100
        },
        { -- 9. Volume
        x = 125,
        y = 300,
        width = 125,
        height = 100
        },
        { -- 10. Compras
        x = 125,
        y = 400,
        width = 125,
        height = 100
        },
        { -- 11. Play
        x = 250,
        y = 0,
        width = 125,
        height = 100
        },
        { -- 12. Cima
        x = 250,
        y = 100,
        width = 125,
        height = 100
        },
        { -- 13. x/não
        x = 250,
        y = 200,
        width = 125,
        height = 100
        },
        { -- 14. Ajuda
        x = 250,
        y = 300,
        width = 125,
        height = 100
        },
        { -- 15. Recordes
        x = 250,
        y = 400,
        width = 125,
        height = 100
        },
        { -- 16. Home
        x = 375,
        y = 0,
        width = 125,
        height = 100
        },
        { -- 17. Botão Baixo
        x = 375,
        y = 100,
        width = 125,
        height = 100
        },
        { -- 18. Yes
        x = 375,
        y = 200,
        width = 125,
        height = 100
        },
        { -- 19. Segurança
        x = 375,
        y = 300,
        width = 125,
        height = 100
        },
        { -- 20. Musica
        x = 375,
        y = 400,
        width = 125,
        height = 100
        },
    }
}

local sprite2 = graphics.newImageSheet ("imagens/button.png", spriteOpcoes)

local botaoEsquerda = display.newImageRect (sprite2, 2, 125/2, 100/2)
botaoEsquerda.x = 250
botaoEsquerda.y = 420

local botaoDireita = display.newImageRect (sprite2, 7, 125/2, 100/2)
botaoDireita.x = 300
botaoDireita.y = 420

local function moverEsquerda (event)
    if (event.phase == "began") then
        player.x = player.x - 1
        player:setSequence ("andando")
        player:play()
        player.xScale = - 0.3

    elseif (event.phase == "moved") then
    player.x = player.x - 1

    elseif (event.phase == "ended") then
    player:setSequence ("parado")
    player:play ()
    player.xScale =  0.3

    end
end
botaoEsquerda:addEventListener ("touch", moverEsquerda)

local function moverDireita (event)
    if (event.phase == "began") then
        player.x = player.x + 1
        player:setSequence ("andando")
        player:play()

    elseif (event.phase == "moved") then
    player.x = player.x + 1

    elseif (event.phase == "ended") then
    player:setSequence ("parado")
    player:play ()
    end
end
botaoDireita:addEventListener ("touch", moverDireita)

local botaoPulo = display.newImageRect (sprite2, 12, 125/2, 100/2)
botaoPulo.x = 280
botaoPulo.y = 380

local function moverPulo (event)
    if (event.phase == "began") then
        player.y = player.y - 1
        player:setSequence ("pulo")
        player:play() 

    elseif (event.phase == "moved") then
        player.y = player.y - 1

    elseif (event.phase == "ended") then
        player:setSequence ("parado")
        player:play()
    end
end
botaoPulo:addEventListener ("touch", moverPulo)

local botaoDerrapar = display.newImageRect (sprite2, 6, 125/3, 100/3)
botaoDerrapar.x = 320
botaoDerrapar.y = 380

local function derrapagem (event)
    if (event.phase == "began") then
        player.x = player.x + 1
        player:setSequence ("derrapando")
        player:play() 

    elseif (event.phase == "moved") then
        player.x = player.x + 1

    elseif (event.phase == "ended") then
        player:setSequence ("derrapando1")
        player:play()
    end
end
botaoDerrapar:addEventListener ("touch", derrapagem)

local texto = display.newText ("Desafio da semana botão cima", 150, 30, native.systemFont, 20)