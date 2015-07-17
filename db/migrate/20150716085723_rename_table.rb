class RenameTable < ActiveRecord::Migration
  def change
  	    rename_table :users_user_stories, :user_stories_users
  end
end
