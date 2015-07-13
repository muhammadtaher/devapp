class DescFile < ActiveRecord::Base
	has_attached_file :file
	belongs_to :user_story
	validates_attachment_content_type :file, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
	
end
