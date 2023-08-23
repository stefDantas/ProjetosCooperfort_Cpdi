-- Atividade aula dia 23/05
local bg = display.newImageRect("image/bg.jpg", 736/2, 920/2)
bg.x = display.contentCenterX
bg.y = display.contentCenterY 

local bruxa = display.newImageRect("image/bruxa.png", 512/5, 512/5)
bruxa.x = 0
bruxa.y = 350 
transition.to(bruxa, {time=3000, x=400, y=-40, yScale=2, xScale=2, alpha=0.2, transition = easing.inCirc})

local bruxa1 = display.newImageRect("image/bruxa.png", 512/5, 512/5)
bruxa1.xScale = -1 -- inverte a imagem
bruxa1.x = 0
bruxa1.y = 0
bruxa1:setFillColor (1, 0, 0)
transition.to(bruxa1, {time=3000, x=400, y=400, yScale=2, xScale=2, alpha=0.2, transition = easing.outInBack})

local abobora = display.newImageRect("image/abobora.png", 600/5, 520/5)
abobora.x = display.contentCenterX
abobora.y = - 100
transition.to(abobora, {delay=3100, time=3000, y=200, yScale=3, xScale=3, iteration=2, transition=easing.outElastic})