class CreateEventos < ActiveRecord::Migration
  def change
    create_table :eventos do |t|
      t.string :descricao
      t.boolean :debido
      t.integer :prazo_id
      t.integer :grupo_evento_id

      t.timestamps
    end
  end
end
