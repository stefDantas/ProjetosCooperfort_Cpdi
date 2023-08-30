-- Criando grupos de exibição

-- Back usado para palno de fundo, decorações que não terão interação com o jogo
local backGroup = display.newGroup() 

-- Usado para os objetos que terão intereção dentro do grupo, grupo principal
local mainGroup = display.newGroup()

-- (User Interface) Utilizado para placar, vidas, texto, que ficarão na frente do jogo sem interação 
local uiGroup = display.newGroup()

-- Metodo Embutido para incluir no grupo:
-- Inclui o objeto no grupo já na sua criação
local bg = display.newImageRect (backGroup, "imagens/bg.jpg", 509*2, 339*2)
bg.x = display.contentCenterX
bg.y = display.contentCenterY

local chao = display.newImageRect ("imagens/chao.png", 4503/5, 613/5)
chao.x = display.contentCenterX
chao.y = 430
-- Metodo Direto para incluir no grupo:
mainGroup:insert (chao)
-- insert = inserir/incluir no grupo


----------------------------   EXERCÍCIO   --------------------------------------
-- Metodo Direto
local nuvem2 = display.newImageRect ("imagens/cloud.png", 2360/10, 984/10)
nuvem2.x = 250
nuvem2.y = 85
backGroup:insert (nuvem2)

-- Metodo Embutido/Indireto
local sun = display.newImageRect (backGroup,"imagens/sun.png", 256/3, 256/3)
sun.x = display.contentCenterX
sun.y = 70

-- Método Direto
local nuvem = display.newImageRect ("imagens/cloud.png", 2360/10, 984/10)
nuvem.x = 55
nuvem.y = 70
backGroup:insert (nuvem)

-- Método Embutido/Indireto
local arvore1 = display.newImageRect (mainGroup, "imagens/tree.png", 1024/6, 1024/6)
arvore1.x = 45
arvore1.y = 325

-- Método Direto
local arvore2 = display.newImageRect ("imagens/tree.png", 1024/6, 1024/6)
arvore2.x = 315
arvore2.y = 327
mainGroup:insert (arvore2)

chao:toFront() ---toFront = leva para frente. /toBack = leva para tráz
arvore2:toFront()
