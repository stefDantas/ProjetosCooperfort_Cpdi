
local Inimigo = {}
-- (x, y) pois vamos determinar a localização no main
function Inimigo.novo (x,y)
    local inimigoSprite = graphics.newImageSheet ("imagens/inimigo.png", {width=90, height=95, numFrames=12})

    local inimigoAnimacao = 
        {
            {name="parado", start=1, count=3, time=300, loopCount=0},
            {name="correndo", start=5, count=8, time=1000, loopCount=0}
        }

    local inimigo = display.newSprite (inimigoSprite, inimigoAnimacao)
    inimigo.x = x
    inimigo.y = y
    inimigo.id = "inimigo" -- semelhante ao myName, mas no consolhe o print vai ser o nome que demos.
    inimigo.direcao = "esquerda"
    inimigo:setSequence ("correndo")
    inimigo:play()
    inimigo.numeroPulo = 0
    physics.addBody (inimigo, "dynamic", {friction=1, box= {x=0, y=0, halfWidth=30, halfHeight=40, angle=0}}) -- física modelo de caixa
    inimigo.isFixedRotation = true
    inimigo.xScale = -1

    local function verificarDirecao ()
        if not (inimigo.x == nil) then
            if (inimigo.direcao == "esquerda") then
                inimigo.x = inimigo.x -2
                if (inimigo.x <= 0) then
                    inimigo.direcao = "direita"
                    inimigo.xScale = 1
                end
            elseif (inimigo.direcao == "direita") then
                inimigo.x = inimigo.x +2
                if (inimigo.x >= 480) then
                    inimigo.direcao = "esquerda"
                    inimigo.xScale = -1
                end
            end
        end
    end
    -- enterFrame: Fica rodando com o tempo do sistema
    Runtime:addEventListener ("enterFrame", verificarDirecao) -- se movimentar sozinho

    return inimigo
end

return Inimigo