class AddContaIdToLancamentos < ActiveRecord::Migration
  def change
  	add_column :lancamentos, :conta_id, :integer
  end
end
