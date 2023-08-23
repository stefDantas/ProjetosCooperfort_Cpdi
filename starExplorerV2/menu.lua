
local composer = require( "composer" )

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------
--O código fora das funções de evento de cena abaixo será executado apenas UMA VEZ, a menos que
-- a cena é totalmente removida (não reciclada) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------

local fundo

local function gotoGame()
	composer.gotoScene ("game")
end

local function gotoRecordes()
	composer.gotoScene ("recordes")
end

-- -----------------------------------------------------------------------------------
-- Funções de evento de cena
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )

	local sceneGroup = self.view
	-- Code here runs when the scene is first created but has not yet appeared on screen

	local bg = display.newImageRect (sceneGroup, "imagens/bg.png", 800, 1400)
	bg.x = display.contentCenterX
	bg.y = display.contentCenterY

	local titulo = display.newImageRect (sceneGroup, "imagens/title.png", 500, 80)
	titulo.x = display.contentCenterX
	titulo.y = 200

	local play = display.newText (sceneGroup, "Play", display.contentCenterX, 700, native.systemFont, 44)
	play:setFillColor(0.82, 0.86, 1)

	local recordes = display.newText (sceneGroup, "Recordes", display.contentCenterX, 810, native.systemFont, 44)
	recordes:setFillColor(0.75, 0.78, 1)

	fundo =  audio.loadStream ("audio/Escape_Looping.wav")

	play:addEventListener ("tap", gotoGame)
	recordes:addEventListener ("tap", gotoRecordes)

end


-- show()
function scene:show( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		--O código aqui é executado quando a cena ainda está fora da tela (mas está prestes a aparecer na tela)


	elseif ( phase == "did" ) then
		-- O código aqui é executado quando a cena está inteiramente na tela
		audio.play (fundo, {channel=1, loops=-1})


	end
end


-- hide()
function scene:hide( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- O código aqui é executado quando a cena está na tela (mas está prestes a sair da tela)

	elseif ( phase == "did" ) then
		-- O código aqui é executado imediatamente após a cena sair totalmente da tela
		audio.stop(1)
	end
end


-- destroy()
function scene:destroy( event )

	local sceneGroup = self.view
-- O código aqui é executado antes da remoção da visualização da cena
	audio.dispose(fundo)
end


-- -----------------------------------------------------------------------------------
-- Ouvintes de função de evento de cena
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------

return scene
