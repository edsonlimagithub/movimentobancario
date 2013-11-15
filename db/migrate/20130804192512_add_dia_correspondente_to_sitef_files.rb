class AddDiaCorrespondenteToSitefFiles < ActiveRecord::Migration
  def change
  	add_column :sitef_files, :dia_correspondente, :date
  end
end
