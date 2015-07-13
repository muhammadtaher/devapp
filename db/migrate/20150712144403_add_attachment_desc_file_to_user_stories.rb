class AddAttachmentDescFileToUserStories < ActiveRecord::Migration
  def self.up
    change_table :user_stories do |t|
      t.attachment :desc_file
    end
  end

  def self.down
    remove_attachment :user_stories, :desc_file
  end
end
