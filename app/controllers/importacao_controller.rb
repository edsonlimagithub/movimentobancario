# encoding: utf-8
class ImportacaoController < ApplicationController
	def sitef
		@sitefFile = SitefFile.new
	end

	def sitefExibirRegistros
		@sitefFile = SitefFile.create(params[:sitef_file])
		@sitefFile.save
		@lancamentos = Array.new
		@registrosArquivoSitef = registrosArquivoSitef
	end

	private

	def registrosArquivoSitef
		valoresValidos = ["REDECARD", "MASTERCARD", "TICKET", "Sysdata", "ALIMENTACA", "SODEXO", "VISA CREDI"]
		rs = File.open("public/arquivos_sitef/arquivo_sitef.prn")
		linhas = Array.new
		rs.each_line do |line|
			colunas = line.force_encoding("iso-8859-1").split(" ")
			if validarLinhaArquivoSitef colunas, valoresValidos
				#abort colunas.length.inspect
				if colunas.length < 12
					colunas.insert 9, " "
				end
				coluna = Hash.new
				coluna[:nome_produto]           = colunas[0]
				coluna[:hora]                   = colunas[1]
				coluna[:nsu_sitef]              = colunas[2]
				coluna[:nsu_host]               = colunas[3]
				coluna[:codigo_transacao]       = colunas[4]
				coluna[:indentifi_pdv]          = colunas[5]
				coluna[:estado_trasacao]        = colunas[6]
				coluna[:numero_cartao_ag_conta] = colunas[7]
				coluna[:valor]                  = colunas[8]
				coluna[:num_par]                = colunas[9]
				linhas << coluna
			end
		end
		return linhas
	end

	def validarLinhaArquivoSitef linha, valoresValidos
		if !valoresValidos.include? linha[0]
			return false
		elsif linha[4] == 'ABERTERM'
			return false
		elsif linha[6] == 'NEGADA'
			return false
		end
		return true
	end
end
