class Invitado < ActiveRecord::Base
  belongs_to :evento
 has_attached_file :invitado_thumbnail, :styles => { :large => "1000x1000#", :medium => "950x950#" }
 has_attached_file :invitado_thumbnail, :styles => { :large => "1000x1000#", :medium => "950x950#" }
  validates_attachment_content_type :invitado_thumbnail, :content_type => /\Aimage\/.*\Z/

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
end
