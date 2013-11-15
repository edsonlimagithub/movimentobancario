class CreateGrupoEventos < ActiveRecord::Migration
  def change
    create_table :grupo_eventos do |t|
      t.string :descricao

      t.timestamps
    end
  end
end
