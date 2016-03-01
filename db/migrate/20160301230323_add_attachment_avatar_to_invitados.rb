class AddAttachmentAvatarToInvitados < ActiveRecord::Migration
  def self.up
    change_table :invitados do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :invitados, :avatar
  end
end
