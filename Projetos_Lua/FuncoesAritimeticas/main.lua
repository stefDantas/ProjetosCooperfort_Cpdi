-- Variável global. (Deve ser evitada)
vidas = 2
print (vidas)
print ("Valor de vidas:" .. vidas) -- Concatenação, queremos imprimir vidas e o valor de vidas.
----------------------------------

-- Variavéis Locais (Só é lida dentro do script)
local pontos = 10
print (pontos)
print ("Valor de pontos: " .. pontos)

------------- Operações Aritiméticas --------------

-- soma:
local laranjas = 10

laranjas = laranjas + 5
print (laranjas)

local bananas = 5

-- soma entre as variáveis
local cesta = 0
cesta = laranjas + bananas
print ("A soma entre as variáveis é: " .. cesta)
-- ou
print ("Na sua cesta possuem " .. cesta.. " frutas")

-- subtração 
cesta = laranjas - bananas
print (bananas)
bananas = bananas - 1
print (bananas)

-- Multiplicação 
local carro = 8
carro = carro*2
print ("Quantidade de carros é: " .. carro)

-- Dividindo pela Multiplicação (OBS: multiplicação é mais rápida que a divisão)
carro = carro * 0.5
print ("Divisão pela multiplicação " .. carro)

-- Divisão
local gato = 6
gato = gato / 2
print ("A divisão final é: " .. gato)

-- Divisão com vírgula
local arvore = 97.5
arvore = arvore / 4
print ("Divisão com vírgula: " .. arvore)
