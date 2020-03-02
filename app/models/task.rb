class Task < ApplicationRecord
  belongs_to :project

  acts_as_list scope: :project

  scope :by_position, -> { order(position: :asc) }
  scope :completed, -> { where(completed: true) }
  scope :uncompleted, -> { where(completed: false) }

  def toggle_completed!
    toggle!(:completed)
    #move_to_top if completed?
  end
end
