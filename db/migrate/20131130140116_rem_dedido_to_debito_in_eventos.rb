class RemDedidoToDebitoInEventos < ActiveRecord::Migration
  def up
  	rename_column :eventos, :debido, :debito
  end

  def down
  	rename_column :eventos, :debito, :debido
  end
end
