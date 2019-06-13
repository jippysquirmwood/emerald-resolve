class UserOrgProject < ApplicationRecord
  belongs_to :user_id
  belongs_to :org_projects
end
