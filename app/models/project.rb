class Project < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy
  # -> { order(:position) },
  #Project.order(created_at: :asc)
end
