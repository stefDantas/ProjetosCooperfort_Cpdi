-- chamar todos os scripspara ser mais "fácil"
-- variáveis de armazenamento de script
local scriptPlayer = require ("Player")
local scriptInimigo = require ("Inimigo")
local scriptHUD = require ("HUD")
local scriptColetavel = require ("Coletavel")

local physics = require ("physics")
physics.start()
physics.setGravity (0, 9.8)
physics.setDrawMode ("hybrid")
-- tirando a barra de notificação
display.setStatusBar (display.HiddenStatusBar)

local bg = display.newImageRect("imagens/bg.png", 800*0.7, 600*0.7)
bg.x = display.contentCenterX
bg.y = display.contentCenterY
-- inserindo o script em uma função local
local hud = scriptHUD.novo()

local chao = display.newImageRect("imagens/chao.png", 4503/6, 613/6)
chao.x = display.contentCenterX
chao.y = display.contentHeight+10
chao.id = "chao"
-- parametros para criar a box {x ref a imagem=, y ref. a imag.=, metade da largura da box=, angulo da box=}    x e y referente a inicilização da box.
physics.addBody (chao, "static", {frction=1, box={x=0, y=0, halfWidth = 480, halfHeight=40, angle=0}})

local inimigo = scriptInimigo.novo (400, 250)

local player = scriptPlayer.novo (40, 200, hud)

-- após um segundo, cria-se a moeda1 = chame-se a função novaMoeda[script coletavel] (x=math.random, y=-100), repetições(o é infinito), "nome do timer"
timer.performWithDelay (1000, function()
    local moeda1 = scriptColetavel.novaMoeda (math.random (0, 480), -100)
    end, 0, "timerMoeda")