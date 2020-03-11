class Task < ApplicationRecord
  belongs_to :project, :counter_cache => true
  validates :name, :project_id, presence: true
  acts_as_list scope: :project
  
  scope :completed, -> { where(completed: true) }
  scope :uncompleted, -> { where(completed: false) }

  def set_defaults
    self.due_day = Date.tomorrow
  end

  def toggle_completed!
    toggle!(:completed)
  end
end
