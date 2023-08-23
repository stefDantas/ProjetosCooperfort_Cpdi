-- criando um Cronometro Regressivo
local secondsLeft = 300 -- 5min *60, manterá o relógio atulizado na contagem
local clockText = display.newText("5:00", display.contentCenterX, display.contentCenterY, native.systemFont,72) -- Colocando relógio na tela.

-- Atualização do tempo
local function updateTime(event)

    secondsLeft = secondsLeft -1 -- Diminuindo 1s a cada periodo de tempo(300s).

     -- rastreamos o tempo em segundos e convertemos em minutos
    local minutos = math.floor(secondsLeft / 60) -- math.floor tansforma o número em inteiro(minutos)
    local segundos = secondsLeft %60 -- % pega a parte fracionária da divisão.

    -- Criamos uma string formatada
    -- Puxando os valores de cima na forma decimal. 
    local timeDisplay = string.format("%02d:%02d", minutos, segundos) 

    -- Atualizando o texto
    clockText.text = timeDisplay
end

local countDownTimer = timer.performWithDelay( 1000, updateTime, secondsLeft )

local caixa = event.target -- nomeia a "caixa" o obj do evento
local phase = event.phase
if ("began" == phase) then
-- Define caixa como foco de toque.
    display.currentStage:setFocus (caixa)
    caixa.touchOffsetX = event.x - caixa.x
    caixa.touchOffsetY = event.y - caixa.y
elseif ("moved" == phase) then
-- A cada fim de toque a localização inicial muda.
    caixa.x = event.x - caixa.touchOffsetX
    caixa.y = event.y - caixa.touchOffsetY
elseif ("ended" == phase or "cancelled" == phase) then
    display.currentStage:setFocus (nil)
end

return true
end