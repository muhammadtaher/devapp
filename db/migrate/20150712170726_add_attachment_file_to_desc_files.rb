class AddAttachmentFileToDescFiles < ActiveRecord::Migration
  def self.up
    change_table :desc_files do |t|
      t.attachment :file
    end
  end

  def self.down
    remove_attachment :desc_files, :file
  end
end
