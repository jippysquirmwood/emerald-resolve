class Org < ApplicationRecord
  has_many :org_projects, dependent: :destroy
  # to events
  has_many :user_org_projects, through: :org_projects
  has_many :events, through: :user_org_projects, source: :authored_events
  # to user
  has_many :users, through: :user_org_projects
  # to project
  has_many :projects, through: :org_projects

  # validations
  validates :name, presence: true, uniqueness: true
  validates :body, presence: true
end
