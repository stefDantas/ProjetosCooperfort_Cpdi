 local retangulo = display.newRect (120, 120, 200, 140)
 retangulo: setFillColor (0.6, 0.4, 0.2)
 
 local circulo = display.newCircle (340, 120, 80)
 circulo: setFillColor (0.5, 0.2, 0.4)
 circulo.alpha = 0.7
 
 local quadrado = display.newRect (530, 120, 140, 140)
 quadrado: setFillColor (0, 0.4, 0.2)

 -- Adicionando um retangulo ou quadrado arrendodado:
 -- Comandos: display.nerRoundedRect (x, y, largura, Altura, raio das bordas)
 local retanguloArrendondado = display.newRoundedRect (730, 120, 200, 140, 30)
 retanguloArrendondado: setFillColor (0.6, 0.6, 0.9)

 -- Adicionar uma linha:
 -- Comandos: display.newLine (xInicial, yInicial, xFinal, yFinal)
 local linha = display.newLine (0, 200, 1100, 200)

 -- Criar um polígono:
 -- Comandos: display.newPolygon (x, y, vertices)
 local localizacaoX = 200
 local localizacaoY = 350
 -- é util criarmos essas localizações quando chamarmos mais de um vez o "personagem"

 local vertices = {0, -110, 27, -35, 105, -35, 43, 16,  65, 90, 0, 45, -65, 90, -43, 15, -105, -35, -27, -35}

 local estrela = display.newPolygon (localizacaoX, localizacaoY, vertices)

 local localizacao2X = 800
 local localizacao2Y = 350
 
 local vertices2 = {0, -110, 27, -35, 105, -35, 43, 16,  65, 90, 0, 45, -65, 90, -43, 15, -105, -35, -27, -35}
 local estrela2 = display.newPolygon (localizacao2X, localizacao2Y, vertices2)

 -- Criando um novo texto:
 -- Comandos: display.newText ("Texto que quero insrir", x, y, fontSize)
 local helloWord = display.newText ("Hello World!", 510, 350, native.systemFont, 50)

 local parametros = {
    text = "Olá Mundo!",
    x = 510,
    y = 390,
    font = "Arial",
    fontSize = 25,
    align = "right"
 }
 local olaMundo = display.newText (parametros)

 -- Adicionar texto em relevo:
 -- Comandos: display.newEmbossedText ()
 local opcoes = {
    text = "Stéfany Dantas",
    x = 510,
    y = 440,
    font = "Arial",
    fontSize = 40
 }

 local textoRelevo = display.newEmbossedText (opcoes)

 -- Adicionar cor ao objeto/texto:
 -- Comandos: variavel: setFillColor (cinza, vermelho, verde, azul, alfa--> transparência)
 helloWord: setFillColor(0.8, 0.4, 0.9)
 helloWord.alpha = 0.5

 olaMundo: setFillColor(0, 0.5, 0.9, 1)

 -- Unidade de medida do RGB
 local color = {
    -- destaque/efeito/ meio
    highlight = {r = 0, g = 0, b = 1},
    -- sombra/ 3
    shadow = {r = 0.3, g = 0.9, b = 1}
 }

 textoRelevo: setFillColor (0.5, 0.5, 0.9, 1)
 textoRelevo: setEmbossColor (color)


 -- Gradientes
 -- Comandos: variavel = { type = " " , Color1 = { , , }, coler2 = { , , }, direction = " " }

 local gradiente = {
    type = "gradient",
    color1 = {0.4, 0.8, 0.9},
    color2 = {0.8, 0.8, 0.8},
    direction = "left" -- "down", "up"...
 }
 local gradiente2 = {
   type = "gradient",
   color1 = {0.4, 0.8, 0.9},
   color2 = {0.8, 0.8, 0.8},
   direction = "right" -- "down", "up"...
}

 estrela: setFillColor (gradiente)
 estrela2: setFillColor (gradiente2)