class AddContaIdInProdutos < ActiveRecord::Migration
  def up
  	add_column :produtos, :conta_id, :integer
  end

  def down
  	remove_column :produtos, :conta_id
  end
end
