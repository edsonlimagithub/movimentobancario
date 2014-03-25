class AddTaxaToProdutos < ActiveRecord::Migration
  def change
  	add_column :produtos, :taxa, :float
  end
end
