class AddDiaCorrespondenteToSoftwayFiles < ActiveRecord::Migration
  def change
  	add_column :softway_files, :dia_correspondente, :date
  end
end
