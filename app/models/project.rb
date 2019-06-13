class Project < ApplicationRecord
# relationship to events
  has_many :events, dependent: :destroy
# relationship to orgs/users etc
  has_many :org_projects, dependent: :destroy
end
