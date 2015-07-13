class AddIndexToUserStory < ActiveRecord::Migration
 def up
   add_column :user_stories, :index, :integer
end

def down
	drop_column :user_stories, :index
end
end
