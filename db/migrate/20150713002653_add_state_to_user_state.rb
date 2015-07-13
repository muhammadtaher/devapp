class AddStateToUserState < ActiveRecord::Migration
  def change
  	  	   add_column :user_stories, :state, :integer
  end
end
