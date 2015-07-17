class AddUsersUserStoriesTable < ActiveRecord::Migration
  def up
		create_table 'users_user_stories', :id => false do |t|
			t.column :user_id, :integer
			t.column :user_story_id, :integer
		end
		add_index('users_user_stories', :user_id)
		add_index('users_user_stories', :user_story_id)
	end
	def down
		drop_table 'users_user_stories'

	end
end
