class UserOrgProject < ApplicationRecord
  belongs_to :user
  belongs_to :org_project

  has_many :authored_events, class_name: "Event", foreign_key: "author_id", dependent: :nullify

  # validations
  validates :user, uniqueness: { scope: :org_project }
  validates :start_date, presence: true
  validates :end_date, presence: true
end
