class Project < ApplicationRecord
  has_many :org_projects, dependent: :destroy
  # to events
  has_many :user_org_projects, through: :org_projects
  has_many :events, through: :user_org_projects
  # to users
  has_many :users, through: :user_org_projects
  # to orgs
  has_many :orgs, through: :org_projects
end
