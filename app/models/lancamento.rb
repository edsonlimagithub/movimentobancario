class Lancamento < ActiveRecord::Base
  attr_accessible :confirmado, :data, :debito, :evento, :valor
end
