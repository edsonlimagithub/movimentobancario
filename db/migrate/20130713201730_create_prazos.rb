class CreatePrazos < ActiveRecord::Migration
  def change
    create_table :prazos do |t|
      t.string :descricao
      t.string :funcao

      t.timestamps
    end
  end
end
