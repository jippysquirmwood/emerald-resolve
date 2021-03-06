class OrgProject < ApplicationRecord
  belongs_to :project
  belongs_to :org

  has_many :user_org_projects, dependent: :destroy
  # to events
  has_many :events, through: :user_org_projects
  # to users
  has_many :users, through: :user_org_projects

  # validations
  validates :project, uniqueness: { scope: :org }
end
