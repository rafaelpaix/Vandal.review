class AddAttachmentImageToEstampas < ActiveRecord::Migration
  def self.up
    change_table :estampas do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :estampas, :image
  end
end
