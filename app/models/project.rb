class Project < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy
  #validates :name, presence: true
  # -> { order(:position) },
  #Project.order(created_at: :asc)
end
