class AddAttachmentPhotoToImages < ActiveRecord::Migration
  def self.up
    change_table :tblImage do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :tblImage, :photo
  end
end
