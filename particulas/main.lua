local physics = require ("physics")
physics.start()
physics.setDrawMode ("normal")

display.setStatusBar (display.HiddenStatusBar)

local chao = display.newRect (display.contentCenterX, 470, 500, 50)
physics.addBody (chao, "static")

-- Colocando parede
local parede1 = display.newRect (-30, display.contentCenterY, 50, 500)
physics.addBody (parede1, "static")

local parede2 = display.newRect (350, display.contentCenterY, 50, 500)
physics.addBody (parede2, "static")

-- Incerindo a particula no Lua
local testeParticula= physics.newParticleSystem (
    {
        -- Nome do arquivo de partícula
        filename = "liquidParticle.png", -- "imagens/liqued..."
        -- radius físico da particula
        radius = 2,
        -- radius da imagem (usar sempre o valor maior que o radius da paertícula para que elas se sobreponham e traga um efeito visual mais satisfatório)
        imagemRadius = 4
    }
)

local function onTimer (event)
    -- Criando a particula
    testeParticula:createParticle (
    { --Determina onde a nova particula é gerada
        x=0,
        y=0,
        -- Valores iniciais de velocidade para a partícula.
        velocityX = 256,
        velocityY = 480,
        -- Define a cor da particula RGBA (A= alpha)
        color = {1, 0.2, 0.4, 1},
        -- Tempo de vida da partícula, quantos segundos elas permanece na tela antes de "morrer" (0 = infinito)
        lifetime = 32.0,
        -- Define o comportamento da particula. "water = água", "colorMixing = mistura as cores em caso de colisão"
        flags = {"water", "colorMixing"}
    }
)
end
timer.performWithDelay (20, onTimer, 0)

testeParticula:createGroup (
    {
        x= 50,
        y= 0,
        color = {0, 0.3, 1, 1},
        halfWidth = 64, -- metade da largura do grupo
        halfHeight = 32, -- metade da altura do grupo
        flags = {"water", "colorMixing"}
    }
)
testeParticula:applyForce (0, -9.8*testeParticula.particleMass)