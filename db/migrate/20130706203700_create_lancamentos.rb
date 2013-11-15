class CreateLancamentos < ActiveRecord::Migration
  def change
    create_table :lancamentos do |t|
      t.boolean :confirmado
      t.date :data
      t.integer :evento
      t.boolean :debito
      t.float :valor

      t.timestamps
    end
  end
end
