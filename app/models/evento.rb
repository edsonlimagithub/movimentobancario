class Evento < ActiveRecord::Base
  attr_accessible :debito, :descricao, :grupo_evento_id, :prazo_id
  
  has_many :lancamentos
  belongs_to :grupo_evento
  belongs_to :prazo
end
