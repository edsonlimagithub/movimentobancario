class AddColunsToRegistroSitef < ActiveRecord::Migration
  def change
  	add_column :registro_sitefs, :nome_produto, :string
  	add_column :registro_sitefs, :hora, :string
  	add_column :registro_sitefs, :nsu_sitef, :string
  end
end
