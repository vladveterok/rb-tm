class AddCompletedTasksToProjects < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :completed_count, :integer, :default => 0

    Project.reset_column_information

    Project.all.each do |p|
      p.update_attribute :completed_count, p.tasks.completed.length
    end
  end
end
