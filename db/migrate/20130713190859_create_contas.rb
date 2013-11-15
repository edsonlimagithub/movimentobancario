class CreateContas < ActiveRecord::Migration
  def change
    create_table :contas do |t|
      t.string :descricao
      t.float :limite
      t.boolean :inativo

      t.timestamps
    end
  end
end
