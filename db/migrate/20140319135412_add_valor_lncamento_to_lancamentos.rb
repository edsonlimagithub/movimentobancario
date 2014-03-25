class AddValorLncamentoToLancamentos < ActiveRecord::Migration
  def change
  	add_column :lancamentos, :valor_lancamento, :float
  end
end
