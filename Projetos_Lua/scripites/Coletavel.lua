local Coletavel = {}

function Coletavel.novaMoeda (x,y)
    local moeda = display.newImageRect ("imagens/coin.png", 46, 46)
    moeda.x = x
    moeda.y = y
    moeda.id = "moeda"
    physics.addBody (moeda, "kinematic", {isSensor=true})
    
    transition.to (moeda, {y=580, time=8000, rotation=1080, onComplete= function()
        display.remove (moeda)
    end })

    return moeda
end

return Coletavel