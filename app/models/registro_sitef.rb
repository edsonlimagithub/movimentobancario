class RegistroSitef < ActiveRecord::Base
  attr_accessible :autorizador, :codi_resp, :codigo_transacao, :data_lancamen, :estado_trasacao, :indentifi_pdv, :lancado, :nsu_host, :num_par, :numero_cartao_banco_ag_co, :valor
end
