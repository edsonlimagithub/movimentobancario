class AddEventoIdInProdutos < ActiveRecord::Migration
  def up
  	add_column :produtos, :evento_id, :integer
  end

  def down
  	remove_column :produtos, :evento_id
  end
end
