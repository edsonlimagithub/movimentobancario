class AddReferenciaToLancamentos < ActiveRecord::Migration
  def change
  	add_column :lancamentos, :referencia, :text
  end
end
