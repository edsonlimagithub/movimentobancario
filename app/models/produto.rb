class Produto < ActiveRecord::Base
  attr_accessible :descricao, :descricao_sitef, :prazo_id, :conta_id, :evento_id, :taxa, :valor_lancamento
  validates :descricao, uniqueness: true
  validates :descricao_sitef, uniqueness: true
  
  belongs_to :prazo
  belongs_to :conta
  belongs_to :evento 

  def self.descricoesSitef
  	descricoes = Array.new
  	produtos = self.find(:all, :select => 'descricao_sitef')
  	produtos.each do |produto|
  		descricoes << produto.descricao_sitef
  	end
  	return descricoes
  end
end
