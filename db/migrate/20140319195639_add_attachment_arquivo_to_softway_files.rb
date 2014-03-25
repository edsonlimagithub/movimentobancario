class AddAttachmentArquivoToSoftwayFiles < ActiveRecord::Migration
  def self.up
    change_table :softway_files do |t|
      t.attachment :arquivo
    end
  end

  def self.down
    drop_attached_file :softway_files, :arquivo
  end
end
