-- Explicação de transição de simples
local circulo = display.newCircle (80, 50, 30)
circulo:setFillColor(0.6, 0.3, 0.9)
circulo.alpha = (0.6)
-- Transições
-- Comandos: trnsition.to(variável, {parâmetros})
transition.to (circulo, {time=3000, y=400})

-- O delta true soma a localização y inicial do circulo1 50+400 = 450. Quando false ele se comporta igual a variável circulo, descontando os priemiros 50, seria 50-400.
local circulo1 = display.newCircle(150, 50, 30)
circulo1:setFillColor(0, 0.6, 0.6)
transition.to(circulo1, {time=3000, y=400, delta=true})

-- iterations é o número de vezes que ele executa o efeito elástico
local circulo2 = display.newCircle ( 220, 50, 30)
circulo2:setFillColor(1, 0.5, 0.5)
transition.to (circulo2, {time=3000, y=400, iterations=4,  transition=easing.outElastic})

-- iterations = -1 (eternamente executando). Alpha = esmaecer/transparente.
local retangulo = display.newRect (150, 100, 50, 70)
retangulo:setFillColor (0.8, 0.6, 0.8)
transition.to(retangulo, {time=3000, rotation=90, yScale=2, alpha=0.2, iterations=-1})
