class Task < ActiveRecord::Base
	belongs_to :user_story
	belongs_to :user_story
	has_and_belongs_to_many :users

	def get_class
		if(done)
			"done_task"
		else
			""
		end
	end
end
