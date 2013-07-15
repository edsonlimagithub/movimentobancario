class SitefFile < ActiveRecord::Base
  attr_accessible :arquivo
  has_attached_file :arquivo,
                  :url  => "/public/arquivos_sitef/:basename.:extension",
                  :path => ":rails_root/public/arquivos_sitef/:basename.:extension"

validates_attachment_presence :arquivo
validates_attachment_size :arquivo, :less_than => 5.megabytes
end
