class ImportacaoController < ApplicationController
	def sitef
		@sitefFile = SitefFile.new
	end

	def sitefSave
		@sitefFile = SitefFile.create(params[:sitef_file])
		@sitefFile.save
	end
end
