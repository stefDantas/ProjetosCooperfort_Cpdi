
local composer = require( "composer" )

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------
--O código fora das funções de evento de cena abaixo será executado apenas UMA VEZ, a menos que
-- a cena é totalmente removida (não reciclada) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
local musicaRecordes

local json = require ("json") -- chama a biblioteca json para cena. (JSON aramazena dados.)
local pontosVariable = {} --String/tabela que armazena os pontos,irá contar as ´pontuações guardadas.
local filePath = system.pathForFile ("pontos.json", system.DocumentsDirectory) -- (filePath == Caminho do arquivo). Cria o arquivopontos.json e juntamente um caminho para a pasta.

local function carregaPontos()
	-- Verifica se o arquivo existe abrindo-o somente para leitura
	local pasta = io.open (filePath, "r")-- "r" == somente leitura

	if pasta then
		local contents = pasta:read ("*a")-- extrai os dados do arquivo e guarad na variavel contets (formato JSON)
		io.close (pasta) -- Fecha o arquivo pontos.json
		pontosTable = json.decode (contents) -- Decodificar a variavel contents de jason para lua e armazena-los na tabela.
	end

	-- Se a tabela não existir ou estiver vazia (# == indice da tabela ou total de dados)
	if (pontosTable == nil or #pontosTable == 0) then
		pontosTable = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0} -- Define as pontuações iniciais.
	end
end

local function salvaPontos()
	for i = #pontosTable, 11, -1 do -- Define que apenas 10 valores possam ser salvos napontosTable.
		table.remove (pontosTable, i) -- remove os dados dos 11 acima.
	end

	--Abre os aqruvos pontos.json para alterações
	local pasta = io.open (filePath, "w")  --("w" == escrever/sobreescrever)

	if pasta then
		-- Inclui os dados da pontosTable no arquivo pontos.json codificada para JSON
		pasta:write (json.encode(pontosTable))
		io.close (pasta) -- Fecha o arquivo pontos.json.
	end
end

local function gotoMenu()
	composer.gotoScene ("menu", {time=800, effect="crossFade"})
end

-- -----------------------------------------------------------------------------------
-- Funções de evento de cena
-- -----------------------------------------------------------------------------------
 
-- create()
function scene:create( event )

	local sceneGroup = self.view
	-- Code here runs when the scene is first created but has not yet appeared on screen

	carregaPontos() -- puxar as pontuações anteriores. Executa a função que extrai as pontuações anteriores.

	-- Acrescenta a pontuação da partida na tabela.
	table.insert(pontosTable, composer.getVariable("scoreFinal"))

	composer.setVariable ("scoreFinal", 0) -- Redefine o valor da váriavel. Evita bugs.

	local function compare (a, b) 
		-- organiza os valores/elementos da pontos.table em ordem decrescente
		return a > b
	end

	table.sort (pontosTable, compare) -- Classifica a ordem definida na function compare para pontosTable

	salvaPontos() -- Salva os dados atualizados no arquivo JSON.
	
	local bg = display.newImageRect (sceneGroup, "imagens/bg.png", 800, 1400)
	bg.x, bg.y = display.contentCenterX, display.contentCenterY

	local cabecalho = display.newText (sceneGroup, "Recordes", display.contentCenterX, 100, native.systemFont, 80)
	cabecalho:setFillColor(0.75, 0.78, 1)

	-- Criando um loop de 1 a 10
	for i = 1, 10 do
		-- atrubui os valores da pontosTable como os do loop.
		if (pontosTable[i]) then
			local yPos = 150 + (i*56) -- Espaçamentos das pontuações conforme o nº. Define que o espaçamento das pontuações seja uniforme de acordo com o nº.

			local ranking = display.newText (sceneGroup, i .. ")", display.contentCenterX-50, yPos, native.systemFont, 44)
			ranking:setFillColor (0.8)

			ranking.anchorX = 1 -- Alinha o texto a direita alterando a âncora.

			local finalPontos =  display.newText (sceneGroup, pontosTable[i], display.contentCenterX-30, yPos, native.systemFont, 44)
			finalPontos.anchorX = 0 -- Alinha o texto a esquerda
		end -- Fecha o if
	end -- Fecha o for

	local menu = display.newText (sceneGroup, "Menu", display.contentCenterX, 810, native.systemFont, 50)
	menu:setFillColor (0.75, 0.78, 1)
	menu:addEventListener ("tap", gotoMenu)

	musicaRecordes = audio.loadStream ("audio/Midnight-Crawlers_Looping.wav")
end


-- show()
function scene:show( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		--O código aqui é executado quando a cena ainda está fora da tela (mas está prestes a aparecer na tela)


	elseif ( phase == "did" ) then
		-- O código aqui é executado quando a cena está inteiramente na tela
		audio.setVolume(0.5,{channel=1})
		audio.play (musicaRecordes, {channel=1, loops=-1})
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
		composer.removeScene("recordes")

		audio.stop(1)
	end
end


-- destroy()
function scene:destroy( event )

	local sceneGroup = self.view
-- O código aqui é executado antes da remoção da visualização da cena
	audio.dispose(musicaRecordes)
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
