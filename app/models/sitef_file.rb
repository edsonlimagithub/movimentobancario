class SitefFile < ActiveRecord::Base
  attr_accessible :arquivo, :dia_correspondente
  has_attached_file :arquivo,
                  :url  => "/public/arquivos_sitef/arquivo_sitef.prn",
                  :path => ":rails_root/public/arquivos_sitef/arquivo_sitef.prn"

validates_attachment_presence :arquivo
validates_attachment_size :arquivo, :less_than => 5.megabytes
end
