class Project < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy
  validates :name, presence: true
  
  after_initialize :set_defaults
  
def set_defaults
  self.name ||= "Lovely new project ^_^"
end
  # -> { order(:position) },
  #Project.order(created_at: :asc)
end
