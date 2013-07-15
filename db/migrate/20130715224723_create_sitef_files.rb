class CreateSitefFiles < ActiveRecord::Migration
  def change
    create_table :sitef_files do |t|

      t.timestamps
    end
  end
end
