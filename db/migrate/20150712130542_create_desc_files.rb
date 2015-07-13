class CreateDescFiles < ActiveRecord::Migration
  def change
    create_table :desc_files do |t|
      t.integer :user_story_id

      t.timestamps null: false
    end
  end
end
