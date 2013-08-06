class Produto < ActiveRecord::Base
  attr_accessible :descricao, :descricao_sitef, :prazo_id
  belongs_to :prazo
end
