class AddAttachmentArquivoToSitefFiles < ActiveRecord::Migration
  def self.up
    change_table :sitef_files do |t|
      t.attachment :arquivo
    end
  end

  def self.down
    drop_attached_file :sitef_files, :arquivo
  end
end
