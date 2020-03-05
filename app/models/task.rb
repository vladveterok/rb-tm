class Task < ApplicationRecord
  belongs_to :project
  validates :name, :project_id, presence: true
  acts_as_list scope: :project

  #scope :by_position, -> { order(:position) }      # !!!---UPON UNCOMMENTING THIS LINE , ADD by_position in _project.html---!!! 
  scope :completed, -> { where(completed: true) }   # !!!---and in _new_project.html
  scope :uncompleted, -> { where(completed: false) }

  def set_defaults
    self.due_day = Date.tomorrow
  end

  def toggle_completed!
    toggle!(:completed)
    #move_to_top if completed?
  end
end
