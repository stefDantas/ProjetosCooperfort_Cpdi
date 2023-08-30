local Teclado = {} -- Armazenar os dados do script

function Teclado.novo (player)
-- Temos duas fases no teclado: up e down
    -- se a Fase de evento for down (tecla precionada)
    local function verificarTecla (event)
        if event.phase == "down" then  -- Enquento o usuário preciona a tecla
            -- se atecla precionada for o d
            if event.keyName == "d" then
                player.direcao = "direita"
                player:setSequence ("correndo")
                player:play()
                player.xScale = 1
            
            elseif event.keyName == "a" then
                player.direcao = "esquerda"
                player:setSequence ("correndo")
                player:play()
                player.xScale = -1
            
            elseif event.keyName == "space" then
                player.numeroPulo = player.numeroPulo +1 
                -- se o numero de pulo for igual a 1 então
                    if player.numeroPulo == 1 then
                    -- aplicado o impulso linear (y)
                        player:applyLinearImpulse (0, -0.4, player.x, player.y)
                    -- se o numeroPulo for igual a 2 então
                    elseif player.numeroPulo == 2 then
                        transition.to (player, {rotation=player.rotation+360, time=750})
                        player:applyLinearImpulse (0, -0.4, player.x, player.y)
                    end
            end
        -- quando a fase de evento for up (soltar a tecla), então
        elseif event.phase == "up" then -- Quando a pessoa solta a tecla
            velocidadeX, velocidadeY = pause
            if event.keyName == "d" then
            player.direcao = "parado"
            player:setSequence ("parado")
            player:play()

            elseif event.keyName == "a" then
            player.direcao = "parado"
            player:setSequence ("parado")
            player:play()
            end
        end
    end
    -- "key": teclado
    Runtime:addEventListener ("key", verificarTecla)

    -- função para notificação
    local function verificarDirecao()
        -- Retorna os valores de velocidadeX, velocidadeY, respectivamente
        local velocidadeX, velocidadeY = player:getLinearVelocity()
        -- print ("Velocidade x: ".. velocidadeX .. ", Velocidade y: " .. velocidadeY)

        if player.direcao == "direita" and velocidadeX <= 200 then
            player:applyLinearImpulse (0.2, 0, player.x, player.y)
        elseif player.direcao == "esquerda" and velocidadeX >= -200 then
            player:applyLinearImpulse (-0.2, 0, player.x, player.y) 
        end
    end
    -- "enterFrame" - executa a função o número de fps/s (nesse caso 60x por segundo)
    Runtime:addEventListener ("enterFrame", verificarDirecao)

end

return Teclado -- "Fechar string Teclado"