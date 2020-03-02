class FixStatusInTasks < ActiveRecord::Migration[6.0]
  def change
    rename_column :tasks, :status, :completed
  end
end
