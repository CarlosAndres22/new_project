class AddAttachmentInvitadoThumbnailToInvitados < ActiveRecord::Migration
  def self.up
    change_table :invitados do |t|
      t.attachment :invitado_thumbnail
    end
  end

  def self.down
    remove_attachment :invitados, :invitado_thumbnail
  end
end
