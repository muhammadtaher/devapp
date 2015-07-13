class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :description
      t.boolean :done
      t.integer :user_story_id

      t.timestamps null: false
    end
  end
end
