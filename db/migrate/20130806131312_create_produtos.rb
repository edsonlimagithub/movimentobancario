class CreateProdutos < ActiveRecord::Migration
  def change
    create_table :produtos do |t|
      t.string :descricao
      t.string :descricao_sitef
      t.integer :prazo_id

      t.timestamps
    end
  end
end
