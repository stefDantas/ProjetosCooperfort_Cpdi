local physics = require ("physics")
physics.start ()
physics.setDrawMode ("hybrid")

display.setStatusBar (display.HiddenStatusBar) -- Oculta a barra de status

local grupoBg = display.newGroup () -- Objetos decorativos (cenário)

local grupoMain = display.newGroup () -- Bloco principal

local grupoUi =  display.newGroup () -- Interface do usuário 

local chao = display.newRect (grupoMain, display.contentCenterX, 470, 300, 20)
chao:setFillColor (0.3, 0, 0.8)
physics.addBody (chao, "static", {isSensor=true})

local plataformaMovel = display.newRect (grupoMain, 280, 470, 60, 15)
plataformaMovel:setFillColor (0.3, 0, 0.8)
physics.addBody (plataformaMovel, "dynamic", {bounce=1})

-- Criando a junta de pistão para a plataformaMovel
local juntaPistao = physics.newJoint ("piston", chao, plataformaMovel, plataformaMovel.x, plataformaMovel.y, 0, -1)
juntaPistao.isMotorEnabled = true
juntaPistao.motorSpeed = 30
juntaPistao.maxMotorForce = 1000
juntaPistao.isLimitEnabled = true
juntaPistao:setLimits (-280, 300)

-- Criando o player
local player = display.newRect (grupoMain, 30, 440, 20, 40)
physics.addBody (player, "kinematic")

-- Criando os botões de controle do personagem
local botaoCima = display.newImageRect (grupoUi, "imagens/button.jpg", 990/35, 1068/35)
botaoCima.x = 300
botaoCima.y= 430





