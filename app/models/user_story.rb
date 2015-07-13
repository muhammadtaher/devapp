class UserStory < ActiveRecord::Base
	belongs_to :project
	has_many :tasks
	has_many :user_stories
	validates_presence_of :name
	def open?
		state == 0 || state.nil?
	end
	def in_process?
		state == 1
	end
	def to_be_verified?
		state == 2
	end
	def completd?
		state == 3
	end
end
