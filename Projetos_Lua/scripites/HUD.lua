-- a primeira função do scrite, precisa ser global 
-- no require estamos chamando está string
local HUD = {}

function HUD.novo()
    -- criar um gp hud para armazenamento da função
    local grupoHUD = display.newGroup ()

    local pontos = 0
    local pontosText = display.newText ("Pontos: ".. pontos, 60, 10, native.systemFont, 20)
    -- função de somar dentro do HUD pq vamos chamar/usar essa função no futuro, função global.
    grupoHUD.somar = function()
        pontos = pontos + 1
        pontosText.text = "Pontos: " .. pontos
    end

    return grupoHUD -- retorno grupo

end
return HUD -- retorno string
