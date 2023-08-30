local physics = require ("physics")
physics.start ()
physics.setGravity (0, 9.8)
physics.setDrawMode ("hybrid")

display.setStatusBar (display.HiddenStatusBar)

local joint

-- Junto do Pivô

-- local staticBox = display.newRect (0, 0, 60, 60)
-- staticBox:setFillColor (0.2, 0.2, 1)
-- physics.addBody (staticBox, "static", {isSensor=true})
-- staticBox.x, staticBox.y = display.contentCenterX, 80

-- local shape = display.newRect (0, 0, 40, 100)
-- shape:setFillColor (1, 0.5, 0.6)
-- physics.addBody (shape, "dynamic")
-- shape.x, shape.y, shape.rotation = 100, staticBox.y-40, 0

-- -- Criando a junta fisíca:
-- -- Criação da junta de pivô ("tipo de junta"; objA, objB, ancoraX, ancoraY )
-- local jointPivot = physics.newJoint ("pivot", staticBox, shape, staticBox.x, staticBox.y)
-- jointPivot.isMotorEnanable = true -- Ativa o motor da junta de pivô
-- jointPivot.motorSpeed = 40 -- Define a velocidade do torque do motor 
-- jointPivot.maxMotorTorque = 1000 -- Define o valor máx da velocidade do torque do motor, utilizado para melhor visualização do efeito

-- jointPivot.isLimitEnabled = true -- Determina como verdadeiro/ativado os limites da rotação.
-- jointPivot:setRotationLimits (-60, 125)

-----------------------------------------------------------------------------------

-- Junta de distância 
-- Os dois estão se esquilibrindo, o comportamemto é diferente da junta anterior apesar de estar sofrendo a mesma gravidade.
-- local staticBox = display.newRect (0, 0, 60, 60)
-- staticBox:setFillColor (0.2, 0.2, 1)
-- physics.addBody (staticBox, "static", {isSensor=true})
-- staticBox.x, staticBox.y = 200, 180

-- local shape = display.newRect (0, 0, 40, 100)
-- shape:setFillColor (1, 0.5, 0.6)
-- physics.addBody (shape, "dynamic", {bounce=1})
-- shape.x, shape.y = 200, 80

-- -- ("tipo de junta", objA, objB, )
-- local jointDistance = physics.newJoint ("distance", staticBox, shape, staticBox.x, staticBox.y - 10, shape.x, shape.y)
-- jointDistance.frequency = 0.8  -- Define os ciclos/frequência do amortecimento em Hz, quanto maior o valor mais macio é o retorno
-- jointDistance.dampingRatio = 0.8 -- Nível de amortecimento, onde 1 é o crítico.
-- -- Temos a aopção de definir a localização:
-- jointDistance.lenght = staticBox.y - shape.y -- Define a distância entre os pontos de ancoragem.

-- shape:applyLinearImpulse (0.3, 0, shape.x, shape.y-5)

-----------------------------------------------------------------------------------

-- Junta do Pistão

-- local staticBox = display.newRect (0, 0, 60, 60)
-- staticBox:setFillColor (0.2, 0.2, 1)
-- physics.addBody (staticBox, "static", {isSensor=true})
-- staticBox.x, staticBox.y = display.contentCenterX, 360

-- local shape = display.newRect (0, 0, 140, 30)
-- shape:setFillColor (1, 0.2, 0.4)
-- physics.addBody (shape, "dynamic", {bounce=1})
-- shape.x, shape.y = display.contentCenterX, 310

-- -- criação da junta de pistão ("tipo de junta", objA, objB, ancoraX, ancoraY, eixoX, eixoY)
-- local jointPiston = physics.newJoint ("piston", staticBox, shape, shape.x, shape.y, 0, 1)

-- jointPiston.isMotorEnabled = true -- Habilita o motor da junta
-- jointPiston.motorSpeed = -30      -- Define a velocidade do motor (valor negativo faz a movimentação inversa)
-- jointPiston.maxMotorForce = 1000  -- Define o valor maximo da força do motor
-- jointPiston.isLimitEnabled = true -- Define que a junta possui limites de movimentação
-- jointPiston:setLimits (-140, 0)   -- Define os limites de movimentação positiva e negativa.  O primeiro valor tem que ser igual ou menor do que segundo

-----------------------------------------------------------------------------------

-- -- Junta de fricção 
local bodies = {} -- Chaves é string ou tabela para armazenamento dos corpos
local bodiesGroup = display.newGroup()
local joints = {}  -- String/tabela para armazenamento das juntas.

-- bodiesGroup.alpha = 0 -- Define que todod sos elementos do grupo possuem um alpha 0

-- local shape1 = display.newRect (bodiesGroup, 0, 0, 40, 40)
-- shape1:setFillColor (1, 0.2, 0.4)
-- physics.addBody (shape1, "dynamic")
-- shape1.x, shape1.y, shape1.rotation = display.contentCenterX-60, 170, 0
-- shape1.angularVelocity = 200  -- Velocidade angular adiciona um impulso ("efeito") ao shape (rotação ao redor do próprio eix o)
-- bodies [#bodies+1] = shape1   -- Adiciona o shape a tabela/ string sem sobrescrever

-- local shape2 = display.newRect (bodiesGroup, 0, 0, 40, 40)
-- shape2:setFillColor (1, 0.2, 0.4)
-- physics.addBody (shape2, "dynamic")
-- shape2.x, shape2.y, shape2.rotation = display.contentCenterX+60, 170, 0
-- shape2.angularVelocity = 200
-- bodies [#bodies+1] = shape2

-- local dirtField = display.newRect (bodiesGroup, 0, 0, 120, 190)
-- dirtField.type = "dirt"
-- dirtField:setFillColor (0.4, 0.25, 0.2)
-- physics.addBody (dirtField, "static", {isSensor=true})
-- dirtField.x, dirtField.y = display.contentCenterX-60, 335
-- bodies [#bodies+1] = dirtField

-- local grassField = display.newRect (bodiesGroup, 0, 0, 120, 190)
-- grassField.type = "grass"
-- grassField:setFillColor (0.1, 0.4, 0.3)
-- physics.addBody (grassField, "static", {isSensor=true})
-- grassField.x, grassField.y = display.contentCenterX+60, 335
-- bodies [#bodies+1] = grassField

-- transition.to (bodiesGroup, {time=600, alpha = 1, transition=easing.outQuad}) -- Transição do grupo para o alfa 1 em 600 milissegundos com efeito outQuad.


-- local function handleCollision (self, event)
--     if (event.phase == "began") then
-- -- Cria duas váriaveis para armazenar limite de força e torque
--         local forceLimit = 0
--         local torqueLimit = 0
-- -- Se o tipo do pooutro objeto colidir for .. então
--         if (event.other.type == "dirt") then
--         -- Altera os valores limites de força e torque
--             forceLimit = 0.22
--             torqueLimit = 0.22
--         else 
--         -- altera para outros valores
--             forceLimit = 0.28
--             torqueLimit = 0.28
--         end 
-- -- Cria um timer com função temporária para criação das juntas 10milissegundos á colisão 
--         timer.performWithDelay (10,
--                 function ()
--             -- Cria-se a junta já dentro da string jonts, onde ObjA é o colidido, e o ObjB o ouvinte dda função, e as ânncoras são criadas de acordo com a localização do ObjB
--                     joints[#joints+1] = physics.newJoint ("friction", event.other, self, self.x, self.y)
--             -- Altera os valores max de força e torque de acordo com o obtidos no if acima.
--                     joints[#joints].maxForce = forceLimit
--                     joints[#joints].maxTorque = torqueLimit
--                 end -- fecha function timer
--                 ) -- fecha o timer
            
        
--     end -- fecha o if Began
-- end -- fecha a function

-- -- Criando a colisão
-- shape1.collision = handleCollision  -- transformando os shapes no self
-- shape1:addEventListener ("collision", shape1)

-- shape2.collision = handleCollision
-- shape2:addEventListener ("collision", shape2)

-----------------------------------------------------------------------------------

-- -- Junta de Solda
-- local shape = display.newRect (0, 0, 60, 60)
-- shape:setFillColor (1, 0.2, 0.4)
-- physics.addBody (shape, "dynamic", {bounce=1})
-- shape.x, shape.y = display.contentCenterX-10, 230

-- local welded = display.newRect (0, 0, 60, 60)
-- physics.addBody (welded, "dynamic", {bounce=1})
-- welded.x, welded.y = display.contentCenterX+40, 180
-- welded.rotation = -25

-- local staticBox = display.newRect (0, 0, display.contentWidth-40, 50)
-- staticBox:setFillColor (0.2, 0.2, 1)
-- physics.addBody (staticBox, "static")
-- staticBox.x, staticBox.y = display.contentCenterX,420

-- local jointWeld = physics.newJoint ("weld", welded, shape, shape.x, shape.y)
-- -- jointWeld.dampingRatio = 0.1
-- -- jointWeld.frequency = 0.1

-----------------------------------------------------------------------------------

-- -- Junta da roda
-- local vehicleBody = display.newRect (bodiesGroup, 0, 0, 110, 20)
-- vehicleBody:setFillColor (0.6, 0.1, 0.7)
-- physics.addBody (vehicleBody, "dynamic")
-- vehicleBody.x, vehicleBody.y = display.contentCenterX-50, 330
-- vehicleBody.isfixeRotation = true
-- bodies [#bodies+1] = vehicleBody

-- local wheelA = display.newCircle (bodiesGroup, 0, 0, 15)
-- wheelA:setFillColor (1, 0.2, 0.4)
-- physics.addBody (wheelA, "dynamic", {bounce=0.5, friction=0.8, radius=15})
-- wheelA.x, wheelA.y = vehicleBody.x-35, vehicleBody.y+30
-- bodies[#bodies+1] = wheelA

-- local wheelB = display.newCircle (bodiesGroup, 0, 0, 15)
-- wheelB:setFillColor (1, 0.2, 0.4)
-- physics.addBody (wheelB, "dynamic", {bounce=0.5, friction=0.8, radius=15})
-- wheelB.x, wheelB.y = vehicleBody.x, vehicleBody.y+30
-- bodies[#bodies+1] = wheelB

-- local wheelC = display.newCircle (bodiesGroup, 0, 0, 15)
-- wheelC:setFillColor (1, 0.2, 0.4)
-- physics.addBody (wheelC, "dynamic", {bounce=0.5, friction=0.8, radius=15})
-- wheelC.x, wheelC.y = vehicleBody.x+35, vehicleBody.y+30
-- bodies[#bodies+1] = wheelC

-- local staticBox = display.newRect (bodiesGroup, 0, 0, display.contentWidth-40, 50)
-- staticBox:setFillColor (0.2, 0.2, 1)
-- physics.addBody (staticBox, "static", {bounce=0, friction=1})
-- staticBox.x, staticBox.y = display.contentCenterX, 420
-- bodies[#bodies+1] = staticBox

-- local bumperA = display.newRect (bodiesGroup, 0, 0, 30, 20)
-- bumperA:setFillColor (0.2, 0.2, 1)
-- physics.addBody (bumperA, "static", {bounce=1, friction=0})
-- bumperA.x, bumperA.y = staticBox.x-staticBox.width/2+15, 385
-- bodies[#bodies+1] = bumperA

-- local bumperB = display.newRect (bodiesGroup, 0, 0, 30, 20)
-- bumperB:setFillColor (0.2, 0.2, 1)
-- physics.addBody (bumperB, "static", {bounce=1, friction=0})
-- bumperB.x, bumperB.y = staticBox.x+staticBox.width/2-15, 385
-- bodies[#bodies+1] = bumperB

-- -- criação das variáveis  para armazenamento dos parametros de frequencia e Damping ratio
-- local springFrequency = 30
-- local springDampingRatio = 1.0

-- -- criação da junta da sting joits ([#joits+1] faz com que a variável não seja sobrescrita)
-- joints[#joints+1] = physics.newJoint ("wheel", vehicleBody, wheelA, wheelA.x, wheelA.y, 1, 1)
-- -- Atribui a frequencia e damping juntados valores já criados anteriormente
-- joints[#joints].springFrequency = springFrequency
-- joints[#joints].springDampingRatio = springDampingRatio

-- joints[#joints+1] = physics.newJoint ("wheel", vehicleBody, wheelB, wheelB.x, wheelB.y, 1, 1)
-- joints[#joints].springFrequency = springFrequency
-- joints[#joints].springDampingRatio = springDampingRatio

-- joints[#joints+1] = physics.newJoint ("wheel", vehicleBody, wheelC, wheelC.x, wheelC.y, 1, 1)
-- joints[#joints].springFrequency = springFrequency
-- joints[#joints].springDampingRatio = springDampingRatio

-- -- Aplicação de torque ás rodas para movimentção do carrinho
-- wheelA:applyTorque (2)
-- wheelB:applyTorque (2)
-- wheelC:applyTorque (2)

-----------------------------------------------------------------------------------

-- Junta da Polia
local bodyA = display.newCircle (bodiesGroup, 0, 0, 40)
bodyA:setFillColor (1, 0.2, 0.4)
physics.addBody (bodyA, "dynamic", {bounce = 0.8, radius=40})
bodyA.x, bodyA.y = display.contentCenterX-50, 260
bodies[#bodies+1] = bodyA

local bodyB = display.newCircle (bodiesGroup, 0, 0, 26)
bodyB:setFillColor (1, 0.2, 0.4)
physics.addBody (bodyB, "dynamic", {bounce = 0.8, radius=26})
bodyB.x, bodyB.y = display.contentCenterX+50, 300
bodies[#bodies+1] = bodyB

local staticBox = display.newRect (bodiesGroup, 0, 0, display.contentWidth-40, 50)
physics.addBody (staticBox, "static", {bounce=0.8})
staticBox.x, staticBox.y = display.contentCenterX, 420
bodies[#bodies+1] = staticBox

-- Criando a junta ("tipo de junta", corpoA, corpoB, pinoA.x, pinoA.y, pinoB.x, pinoB.y ancoraA.x, ancoraA.y, ancoraB.x, ancoraB.y)
local joint = physics.newJoint ("pulley", bodyA, bodyB, bodyA.x, bodyA.y-100, bodyB.x, bodyB.y-140 --[[pontos da dobra/angulação da corda]], bodyA.x, bodyA.y, bodyB.x, bodyB.y --[[comprimento da corda/final da corda]], 1.0)
