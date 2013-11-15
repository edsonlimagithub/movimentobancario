class Lancamento < ActiveRecord::Base
  attr_accessible :confirmado, :data, :evento, :valor, :debito
  validates_presence_of :data, :valor
  belongs_to :evento
  belongs_to :conta
  belongs_to :prazo
end
