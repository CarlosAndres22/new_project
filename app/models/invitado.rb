class Invitado < ActiveRecord::Base
  belongs_to :evento
 has_attached_file :invitado_thumbnail, :styles => { :large => "1000x1000#", :medium => "550x550#" }
  validates_attachment_content_type :invitado_thumbnail, :content_type => /\Aimage\/.*\Z/
end
