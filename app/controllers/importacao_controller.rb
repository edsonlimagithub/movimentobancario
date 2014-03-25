# encoding: utf-8
require 'convert_value'

class ImportacaoController < ApplicationController
	
	#importar arquivo sitef
	def sitef
		@tipo = params[:tipo]
		@sitefFile = SitefFile.new
	end

	def sitefExibirRegistros
		@sitefFile = SitefFile.create(params[:sitef_file])
		#@siteFile.umask(777)
		@sitefFile.save
		if params[:tipo] == "sitef"
			@registrosArquivoSitef = registrosArquivoSitef
		elsif params[:tipo] == "softway"
			@registrosArquivoSitef = registrosArquivoSoftway
		end

		@registrosArquivoSitef.each_with_index do |r, index|
			if Produto.find(:first, :conditions => ["descricao = ?", r[:nome_produto]])
				@registrosArquivoSitef[index][:situacao] = 'OK'
			else
				@registrosArquivoSitef[index][:situacao] = 'Não cadastrado'
			end
		end
	end

	#processa arquivo sitef, salvando registro sitef e efetuando os lançamentos
	def processaRegistrosSitef
		registrosArquivoSitef.each do |ras|
			if salvaRegistroSitef ras
				criarLancamento ras, params[:data]
			end
		end
		redirect_to '/importacao/sitef'
	end

	#importar arquivo softway
	def softway
		@softwayfFile = SoftwayFiles.new
	end

	def softwayExibirRegistros
		@softwayFile = SoftwayFiles.create(params[:softway_file])
		#@siteFile.umask(777)
		@softwayFiles.save
		@registrosArquivoSoftway = registrosArquivoSoftway
		@registrosArquivoSoftway.each_with_index do |r, index|
			if Produto.find(:first, :conditions => ["descricao = ?", r[:nome_produto]])
				@registrosArquivoSitef[index][:situacao] = 'OK'
			else
				@registrosArquivoSitef[index][:situacao] = 'Não cadastrado'
			end
		end
	end

	private

	def convertFormat valor
	    while valor["."]
	      valor["."] = ""  
	    end
	    valor[","]   = "."
	    return valor
  	end 

	def criarLancamento registroArquivoSitef, data_correspondente
		produto = Produto.find :first, :conditions => ["descricao_sitef = ?", registroArquivoSitef[:nome_produto]]
		data = dataLancamento produto.prazo.funcao, data_correspondente
		if registroArquivoSitef[:num_par].blank?
			registroArquivoSitef[:num_par] = 1
		end 
		valor = (convertFormat registroArquivoSitef[:valor]).to_f
		(1..registroArquivoSitef[:num_par].to_i).each do |registro| 
			lancamento            = Lancamento.new
			lancamento.data       = data
			valor = valor / registroArquivoSitef[:num_par].to_i
			valor_taxado = valor - (valor * produto.taxa) / 100  
			lancamento.valor            = valor_taxado
			lancamento.valor_lancamento = valor
			lancamento.evento           = produto.evento
			lancamento.conta            = produto.conta
			lancamento.referencia       = produto.descricao +  " : " + registroArquivoSitef[:nsu_sitef]
			lancamento.save
			data = dataLancamento produto.prazo.funcao, data
		end
	end

	def dataLancamento prazo_funcao, data_correspondente
		data_correspondente = data_correspondente.to_date
		case prazo_funcao
		when "dias30"
			data_retorno = data_correspondente + 30.day
		when "dias01"
			data_retorno = data_correspondente + 1.day
		else
			return false
		end
		return data_retorno
				
	end

	def salvaRegistroSitef registroArquivoSitef
		if !RegistroSitef.find(:first, :conditions => ["nsu_sitef = ?", registroArquivoSitef[:nsu_sitef]])
			registroSitef = RegistroSitef.new(registroArquivoSitef)
			if registroSitef.save
				return true
			end
		else
			return false
		end
	end

	def registrosArquivoSitef
		valoresValidos = Produto.descricoesSitef
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
		elsif linha[5].blank?
			return false
		end
		return true
	end

	def validarLinhaArquivoSoftway linha, valoresValidos
		
		if linha.length < 8
			return false
		elsif !linha[0].include? "000000"
			return false
		#teste para coluna código transação
		elsif linha[6] == 'ABERTERM'
			return false
		#teste para coluna estado transação
		elsif linha[6] == 'NEGADA'
			return false
		end
		return true
	end

	def registrosArquivoSoftway
		valoresValidos = Produto.descricoesSitef
		rs = File.open("public/arquivos_sitef/arquivo_sitef.prn")
		linhas = Array.new
		rs.each_line do |line|
			colunas = line.force_encoding("iso-8859-1").split(" ")
			if validarLinhaArquivoSoftway colunas, valoresValidos
				coluna = Hash.new
				puts colunas.inspect
				coluna[:nome_produto]           = "Softway"
				coluna[:nsu_sitef]              = colunas[2]
				coluna[:codigo_transacao]       = colunas[4]
				coluna[:indentifi_pdv]          = colunas[5]
				coluna[:estado_trasacao]        = colunas[6]
				if colunas.length == 10 
					coluna[:valor]              = colunas[8]
					coluna[:num_par]            = colunas[9]
				elsif colunas.length == 9       
					colunas[:valor]             = colunas[8]
					coluna[:num_par]            = colunas[9]
				end
				linhas << coluna

			end
		end
		return linhas
	end

end
