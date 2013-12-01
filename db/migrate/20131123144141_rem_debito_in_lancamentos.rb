class RemDebitoInLancamentos < ActiveRecord::Migration
  def up
  	remove_column :lancamentos, :debito
  end

  def down
  	add_column :lancamentos, :debito, :boolean
  end
end
