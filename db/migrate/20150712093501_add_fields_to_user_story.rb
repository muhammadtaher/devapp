class AddFieldsToUserStory < ActiveRecord::Migration
  def change
  	 add_column :user_stories, :name, :string
  	 add_column :user_stories, :description, :text
  end
end
