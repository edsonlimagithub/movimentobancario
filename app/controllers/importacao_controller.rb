# encoding: utf-8
class ImportacaoController < ApplicationController
	def sitef
		@sitefFile = SitefFile.new
	end

	def sitefExibirRegistros
		@sitefFile = SitefFile.create(params[:sitef_file])
		@sitefFile.save
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

	def criarLancamento registroArquivoSitef, data_correspondente
		produto = Produto.find :first, :conditions => ["descricao_sitef = ?", registroArquivoSitef[:nome_produto]]
		data = dataLancamento produto.prazo.funcao, data_correspondente

		if data
			evento = Evento.find(2)
			lancamento = Lancamento.new
			lancamento.data = data
			lancamento.valor = registroArquivoSitef[:valor]
			lancamento.debito = false 
			lancamento.save
			abort lancamento.inspect
		end
	end

	def dataLancamento prazo_funcao, data_correspondente
		data_correspondente = data_correspondente.to_date
		case prazo_funcao
		when "dias30"
			data_retorno = data_correspondente + 30.day
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
		valoresValidos = ["REDECARD", "MASTERCARD", "TICKET", "Sysdata", "ALIMENTACA", "SODEXO", "VISA CREDI",
			"VISA ELECT", "Libercard", "BNBCLUBE", "MAESTRO", "ELO DEBITO", "ELO CREDIT", "GREENCARD", "HIPERCARD"]
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
