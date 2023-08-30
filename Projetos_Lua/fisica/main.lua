-- Física
-- Chamar a biblioteca: atribui a biblioteca interna de física á variável physics
local physics = require("physics")
-- Iniciar a física no projeto
physics.start()
-- Definir a gravidade do projeto: Definimos a gravidade(x,y) do projeto.
physics.setGravity(0, 9.8)
-- Definir a rederização da visualização da física (usado somente durante o desenvolvimento para testes)
-- Modos de renderização: normal: Aparece apenas as imagens, corpos físicos invisíveis (padrão sistema). hybrid: Mostra as imagens e os corpos físicos. debug: Mostra apenas os corpos físicos.
physics.setDrawMode("hybrid")

-- Adicionando objetos físicos:
local retangulo = display.newRect(150, display.contentCenterY, 150, 100)
-- Transforma a imagem em um objeto/corpo físico, e ele cai pq está interagindo com a gravidade.
-- Corpo Dianimico = para colisão. Colide com todos os corpos e tem interação com a gravidade e com a interação manual.
physics.addBody (retangulo, "dynamic")

local chao = display.newRect (display.contentCenterX, 400, 450, 30)
-- Corpo Estático = parede, casa. Algo que não se move dentro do jogo, porém o personagem não vai "atravessar". Não interage com a gravidade.
physics.addBody (chao, "static")

-- Corpo Estático (static), não se move. Só colide com o dinâmico.
-- Corpo Cinemático (kinematic), só colide com dinâmico.

local circulo = display.newCircle(350, 50, 30)
-- Corpo cinemático: não interage com a gravidade e colide apenas com o Dinâmico.
physics.addBody (circulo, "kinematic", {radius = 30})

local quadrado = display.newRect(display.contentCenterX, 0, 50, 50)
physics.addBody (quadrado, "dynamic", {bounce=1, friction=0, density=0.5})
-- Torque adiciona um rotação em torno do próprio eixo. Valores positivos giram sentido horário e negativo anti horário.
quadrado:applyTorque (80)