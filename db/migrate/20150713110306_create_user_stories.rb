class CreateUserStories < ActiveRecord::Migration
  def change
  	drop_table :user_stories
    create_table :user_stories do |t|
      t.integer :project_id
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end
