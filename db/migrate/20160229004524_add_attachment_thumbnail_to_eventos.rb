class AddAttachmentThumbnailToEventos < ActiveRecord::Migration
  def self.up
    change_table :eventos do |t|
      t.attachment :thumbnail
    end
  end

  def self.down
    remove_attachment :eventos, :thumbnail
  end
end
