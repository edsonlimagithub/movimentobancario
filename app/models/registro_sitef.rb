class RegistroSitef < ActiveRecord::Base
  attr_accessible :nome_produto, :nsu_sitef, :autorizador, :codi_resp, :codigo_transacao, :data_lancamen, 
	  	:estado_trasacao, :indentifi_pdv, :lancado, :nsu_host, :num_par, :numero_cartao_banco_ag_co, :valor
  validates :nsu_sitef, uniqueness: true
end
