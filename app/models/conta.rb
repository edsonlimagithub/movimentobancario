class Conta < ActiveRecord::Base
  attr_accessible :descricao, :inativo, :limite
  has_many :lancamentos
end
