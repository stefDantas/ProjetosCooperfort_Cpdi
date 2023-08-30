-- -- Incluido funções
-- -- Função para detecatr o click do botão, começa com function seguido de nome (nome da função), e finalizar com end
-- local function detectarTap (event) -- determina que é uma função de evento, no caso O CLICK
--     -- Código que é executado quando o botão for tocado
--     -- tostring: usamos junto com a concatenação para SEQUENCIAR a função que vem após
--     -- event.target: nomear o objeto do evento, ou objeto tocado.
--     print("Objeto tocado:" .. tostring (event.target))

--     return true -- "zerar" todos os dados depois da função executada.
-- end

-- local botaoTap = display.newRect (250, 200, 150, 60)
-- botaoTap:addEventListener("tap", detectarTap)
-- -- Adiciona evento ao ouvinte "tap" ao objeto.

-- local function tapDuplo (event)
--     -- se (número de taps do event for igual a 2) então
--     if(event.numTaps == 2 ) then
--         print("Objeto tocado duas vezes: " .. tostring (event.target))
--     else -- se não
--         return true
--     end
-- end

-- local botaoDuplo = display.newRect (285, 270, 80,50)
-- botaoDuplo:setFillColor (0.6, 0.5, 0.9)
-- botaoDuplo:addEventListener("tap", tapDuplo)

-- -- Evento de toque (Touch)
-- -- Fases de toque:
--     -- began = Primeira fase de toque, quando o usuário encosta na tela.
--     -- moved = Quando o usuário mantém o toque e move pela tela
--     -- ended = Quando o usuário retira o dedo da tela
--     -- cancelled = quando o enveto/toque é cancelado pelo sistema.

-- local function fasesToque(event)
-- -- Se a fase de toque for igual a began então
--     if (event.phase == "began") then 
--         print ("objeto tocado: " .. tostring(event.target))
--     -- Porém se a fase de toque for igual a moved
--     elseif (event.phase == "moved") then
--         print ("localização de toque nas seguintes coordenadas: x = " .. event.x .. ", y = " .. event.y)
--     -- Entretanto se a fase de toque for igual a ended ou cancelled então
--     elseif(event.phase == "ended" or "cancelled" ) then
--         print ("touch terminado no objeto: " .. tostring(event.target))
--     end

--     return true -- não dicipa a função na tela inteira
-- end

-- local botaoTouch = display.newCircle(80, 350, 55)
-- botaoTouch:setFillColor(1, 0.8, 0.5)
-- botaoTouch:addEventListener("touch", fasesToque)


--------------------------------------------------------------------------------------------------------------------

-- Multitoque:
-- Para utilizar o multitouch precisamos habilitar (ativar) primeiro.
system.activate ("multiTouch")  -- Ativamos a biblioteca interna do sistema

local retangulo = display.newRect(display.contentCenterX, display.contentCenterY, 280, 400)
retangulo:setFillColor(0.5, 0.8, 0.9)

local function eventoTouch (event)
    print("Fase de toque: " .. event.phase)
    print("Localização x: " .. tostring(event.x) .. ", Localização y: " .. tostring(event.y))
    print("ID de toque exclusivo: " .. tostring(event.id)) -- multitoch
    print("--------")
    
    return true
end

retangulo:addEventListener("touch", eventoTouch)

