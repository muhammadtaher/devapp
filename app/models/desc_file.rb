class DescFile < ActiveRecord::Base
	has_attached_file :file
	belongs_to :user_story
	validates_attachment_content_type :file, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif","application/pdf","application/vnd.ms-excel","application/vnd.openxmlformats-officedocument.spreadsheetml.sheet","application/msword","application/vnd.openxmlformats-officedocument.wordprocessingml.document","text/plain"]
end
