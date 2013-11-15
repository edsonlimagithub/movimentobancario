class RenEventoToEventoIdInLancamentos < ActiveRecord::Migration
  def up
  	rename_column :lancamentos, :evento, :evento_id
  end

  def down
  	rename_column :lancamentos, :evento_id, :evento
  end
end
