class RemPrazoIdInEvento < ActiveRecord::Migration
  def up
  	remove_column :eventos, :prazo_id
  end

  def down
  	add_column :eventos, :prazo_id, :integer 
  end
end
