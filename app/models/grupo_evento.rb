class GrupoEvento < ActiveRecord::Base
  attr_accessible :descricao
  has_many :eventos
end
