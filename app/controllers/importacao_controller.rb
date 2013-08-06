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

	#processa arquivo sitef, salvando registro sitef e efetuando os lançamentos
	def processaRegistrosSitef
		registrosArquivoSitef.each do |ras|
			salvaRegistroSitef ras
			criarLancamento ras, params[:data]
		end
	end

	private

	def criarLancamento resgistroArquivoSitef
		abort 'criar lançamentos'
		if true
			return true
		else
			return false
		end
	end

	def salvaRegistroSitef registroArquivoSitef
		if !RegistroSitef.find(:first, :conditions => ["nsu_sitef = ?", registroArquivoSitef[:nsu_sitef]])
			registroSitef = RegistroSitef.new(registroArquivoSitef)
			registroSitef.save
		end
	end

	def registrosArquivoSitef
		valoresValidos = ["REDECARD", "MASTERCARD", "TICKET", "Sysdata", "ALIMENTACA", "SODEXO", "VISA CREDI"]
		rs = File.open("public/arquivos_sitef/arquivo_sitef.prn")
		linhas = Array.new
		rs.each_line do |line|
			colunas = line.force_encoding("iso-8859-1").split(" ")
			if validarLinhaArquivoSitef colunas, valoresValidos
				coluna = Hash.new
				coluna[:nome_produto]           = colunas[0]
				coluna[:nsu_sitef]              = colunas[1]
				coluna[:codigo_transacao]       = colunas[2]
				coluna[:indentifi_pdv]          = colunas[3]
				coluna[:estado_trasacao]        = colunas[4]
				coluna[:valor]                  = colunas[5]
				coluna[:num_par]                = colunas[6]
				linhas << coluna
			end
		end
		return linhas
	end

	def validarLinhaArquivoSitef linha, valoresValidos
		if !valoresValidos.include? linha[0]
			return false
		#teste para coluna código transação
		elsif linha[4] == 'ABERTERM'
			return false
		#teste para coluna estado transação
		elsif linha[6] == 'NEGADA'
			return false
		end
		return true
	end
end
