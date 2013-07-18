class CreateRegistroSitefs < ActiveRecord::Migration
  def change
    create_table :registro_sitefs do |t|
      t.boolean :lancado
      t.string :nsu_host
      t.string :codigo_transacao
      t.string :indentifi_pdv
      t.string :codi_resp
      t.string :estado_trasacao
      t.string :numero_cartao_banco_ag_co
      t.string :valor
      t.string :num_par
      t.string :autorizador
      t.string :data_lancamen

      t.timestamps
    end
  end
end
