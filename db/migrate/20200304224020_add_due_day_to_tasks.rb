class AddDueDayToTasks < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :due_day, :date
  end
end
