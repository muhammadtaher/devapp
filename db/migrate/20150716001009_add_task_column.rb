class AddTaskColumn < ActiveRecord::Migration
  def change
  	add_column :user_stories, :task_id, :integer
  end
end
