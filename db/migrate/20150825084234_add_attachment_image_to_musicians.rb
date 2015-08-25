class AddAttachmentImageToMusicians < ActiveRecord::Migration
  def self.up
    change_table :musicians do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :musicians, :image
  end
end
