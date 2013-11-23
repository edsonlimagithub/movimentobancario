class Prazo < ActiveRecord::Base
  attr_accessible :descricao, :funcao
  has_many :produtos
  has_many :evento
end
