class AddDefaultToState < ActiveRecord::Migration
  def change
  	  	change_column_default(:user_stories, :state, 0)
  end
end
