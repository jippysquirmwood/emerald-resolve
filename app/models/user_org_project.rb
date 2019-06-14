class UserOrgProject < ApplicationRecord
  belongs_to :user
  belongs_to :org_project

  has_many :authored_events, class_name: "Event", foreign_key: "author_id", dependent: :nullify
end
