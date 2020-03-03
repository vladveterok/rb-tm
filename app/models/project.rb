class Project < ApplicationRecord
  belongs_to :user
  has_many :tasks, -> { order(:position) }, dependent: :destroy

  #Project.order(created_at: :asc)
end
