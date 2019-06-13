class OrgProject < ApplicationRecord
  belongs_to :project_id
  belongs_to :org_id
end
