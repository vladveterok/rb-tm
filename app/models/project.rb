class Project < ApplicationRecord
  belongs_to :user
  has_many :tasks

  #Project.order(created_at: :asc)
end
