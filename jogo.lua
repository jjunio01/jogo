jogo = {jogador1, jogador2, tabuleiro}


function jogo:novo()

	local tabuleiro = require("tabuleiro")
	local jogador = require("jogador")

	local novoJogo = {}

	novoJogo = setmetatable(novoJogo, {__index = jogo})

	novoJogo.jogador1 = jogador:inicializar()
	novoJogo.jogador2 = jogador:inicializar()
	novoJogo.tabuleiro = tabuleiro:inicializar()


	return novoJogo

end


function jogo:novaJogada(linha, coluna, jogador)



		if linha >= 1 and linha <= 3 and coluna >= 1 and coluna <=3 then

			if self.tabuleiro[linha][coluna] == " " then

				self.tabuleiro[linha][coluna] = jogador.jogada
				return true
			else
				print("Posi��o j� jogada")
				return false
			end
		else
			print("Posi��o inv�lida")
		end

	return false

end

function jogo:vencedor()

local contador = 10

--Verifica��o de jogo Empatado
	for linha = 1, 3 do

		for coluna = 1 , 3 do

			if self.tabuleiro[linha][coluna] ~= " " then

				contador = contador - 1

			end
		end
	end

	if contador == 1 then

		print("Jogo Empatado")

		return true
	end


	for coluna = 1, 3 do

		if self.tabuleiro[1][coluna] ~= " "  and self.tabuleiro[1][coluna] == self.tabuleiro[2][coluna] and self.tabuleiro[2][coluna] == self.tabuleiro[3][coluna] then

			return true

		end

	end


	for linha = 1, 3 do

		if self.tabuleiro[linha][1] ~= " "  and self.tabuleiro[linha][1] == self.tabuleiro[linha][2] and self.tabuleiro[linha][2] == self.tabuleiro[linha][3] then

			return true

		end

	end


	if self.tabuleiro[1][1] ~= " " and self.tabuleiro[1][1] == self.tabuleiro[2][2] and self.tabuleiro[2][2] == self.tabuleiro[3][3] then

		return true

	end

	if self.tabuleiro[1][3] ~= " " and self.tabuleiro[1][3] == self.tabuleiro[2][2] and self.tabuleiro[2][2] == self.tabuleiro[3][1] then

		return true

	end


	return false

end

return jogo