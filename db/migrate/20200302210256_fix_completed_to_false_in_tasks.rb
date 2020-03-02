class FixCompletedToFalseInTasks < ActiveRecord::Migration[6.0]
  def change
    remove_column :tasks, :completed
    add_column :tasks, :completed, :boolean, null: false, default: false
  end
end
