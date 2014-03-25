class CreateSoftwayFiles < ActiveRecord::Migration
  def change
    create_table :softway_files do |t|

      t.timestamps
    end
  end
end
