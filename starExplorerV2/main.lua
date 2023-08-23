local composer = require("composer")

display.setStatusBar(display.HiddenStatusBar) -- remove a barra de notficação

math.randomseed (os.time())

-- Reservar um canal de audio, musica de fundo)
audio.reserveChannels(1)
audio.setVolume(0.1, {channel=1})

-- Comando que inicia a cena inicial.
composer.gotoScene ("menu")