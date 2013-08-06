class Prazo < ActiveRecord::Base
  attr_accessible :descricao, :funcao
  has_many :produtos
end
