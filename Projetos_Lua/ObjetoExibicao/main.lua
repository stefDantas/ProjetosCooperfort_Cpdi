-- Adicionar uma nova imagem na tela:
-- Comandos: display.newImageRect ("Pasta/arquivo.formato", largura, altura)
local bg = display.newImageRect ("imagens/bg.jpg", 1280*1.25, 720*1.25) --Multiplicação para ajustar na tela

-- Definir localização
-- Comando: variável.linha que vou definir = localização na linha.
bg.x = display.contentCenterX -- comando que centraliza a váriavel em qualquer resolução.
bg.y = display.contentCenterY 

-- Colocando o charmander na tela
local charmander = display.newImageRect ("imagens/charmander.png", 507/2.2, 492/2.2)
-- Unidade de medida em pixels
charmander.x = 400
charmander.y = 350

-- Colocando o Pikachu no centro da tela
local pikachu = display.newImageRect ("imagens/pikachu.png", 1197/3, 1254/3) --Divisão para ajustar na tela

pikachu.x = display.contentCenterX
pikachu.y = 610

--  Temos várias opções de Content: left, right, top e low.
--  É INTERESSANTE quando queremos objetos perto das bordas, para que não haja perigo de em outro despositivo não aparacer na tela


---------------------------------------------  /  /  ------------------------------------------------------

-- Criando um retângulo:
-- Comandos: diplay.newRect (localizações x, y, largura, altura)
local retangulo = display.newRect (750, 380, 100, 70)

-- Inserindo a rosa ao cenário
local rosa = display.newImageRect ("imagens/rosa2.png", 678/3, 900/3)
rosa.x = 750
rosa.y = 410

-- Inserindo o Mystery na tela
local mystery = display.newImageRect ("imagens/mystery.png", 493/2.2, 506/2.2)

mystery.x = 780
mystery.y = 250

-- Criando um círculo 
-- Comandos: display.newCircle (x, y, radious/raio/metade do circulo)
local circulo = display.newCircle (150, 80, 50)

-- Inserindo a Pokebola no cenário
local pokeball = display.newImageRect ("imagens/Pokeball.png", 800/6, 800/6)

pokeball.x = 150
pokeball.y = 80 


