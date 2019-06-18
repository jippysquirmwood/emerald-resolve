class Event < ApplicationRecord
  # belongs_to :author
  belongs_to :author, foreign_key: "author_id", class_name: "UserOrgProject"

  # validations
  validates :description, presence: true
  validates :body, presence: true
end
