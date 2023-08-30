local bg = display.newImageRect("imagens/sky.png", 960*3, 240*3)
bg.x = display.contentCenterX
bg.y = display.contentCenterY

local chao = display.newImageRect("imagens/ground.png", 1028/2, 256/2)
chao.x = display.contentCenterX
chao.y = 450

local player = display.newImageRect("imagens/player.png", 532/3, 469/3)
player.x = 50
player.y = 320

 -- Andar para a direita 
local function direita()
    player.x = player.x + 5
end

local botaoDireita = display.newImageRect("imagens/button.png", 1280/40, 1279/40)
botaoDireita.x = 295
botaoDireita.y = 440
botaoDireita:addEventListener("tap", direita)

local function esquerda()
    player.x = player.x - 5
end

local botaoEsquerda = display.newImageRect ("imagens/button.png", 1280/40, 1279/40)
botaoEsquerda.x = 225
botaoEsquerda.y = 440
botaoEsquerda.rotation = 180
botaoEsquerda:addEventListener("tap", esquerda)

local function donw()
    player.y = player.y + 5
end

local botaoDonw = display.newImageRect ("imagens/button.png", 1280/40, 1279/40)
botaoDonw.x = 260
botaoDonw.y = 465
botaoDonw.rotation = 90
botaoDonw:addEventListener("tap", donw)

local function up()
    player.y = player.y - 5
end

local botaoUp = display.newImageRect ("imagens/button.png", 1280/40, 1279/40)
botaoUp.x = 260
botaoUp.y = 420
botaoUp.rotation = 270
botaoUp:addEventListener("tap", up)

local function diagonalDiCm()
    player.x = player.x + 5
    player.y = player.y - 5
end

local botaoDiagonalDireitaCima = display.newImageRect("imagens/button.png", 1280/45, 1279/45)
botaoDiagonalDireitaCima.x = 290
botaoDiagonalDireitaCima.y = 410
botaoDiagonalDireitaCima.rotation = 310
botaoDiagonalDireitaCima:addEventListener("tap", diagonalDiCm)

local function diagonalEsCm()
    player.x = player.x - 5
    player.y = player.y - 5
end

local botaoDiagonalEsquerdaCima = display.newImageRect("imagens/button.png", 1280/50, 1279/50)
botaoDiagonalEsquerdaCima.x = 230
botaoDiagonalEsquerdaCima.y = 410
botaoDiagonalEsquerdaCima.rotation = 220
botaoDiagonalEsquerdaCima:addEventListener("tap", diagonalEsCm)

local function diagonalDiBx()
    player.x = player.x + 5
    player.y = player.y + 5
end

local botaoDiagonalDireitaBaixo = display.newImageRect("imagens/button.png", 1280/50, 1279/50)
botaoDiagonalDireitaBaixo.x = 290
botaoDiagonalDireitaBaixo.y = 470
botaoDiagonalDireitaBaixo.rotation = 40
botaoDiagonalDireitaBaixo:addEventListener("tap", diagonalDiBx)

local function diagonalEsBx()
    player.x = player.x - 5
    player.y = player.y + 5
end

local botaoDiagonalEsquerdaBaixo = display.newImageRect("imagens/button.png", 1280/50, 1279/50)
botaoDiagonalEsquerdaBaixo.x = 230
botaoDiagonalEsquerdaBaixo.y = 470
botaoDiagonalEsquerdaBaixo.rotation = 140
botaoDiagonalEsquerdaBaixo:addEventListener("tap", diagonalEsBx)