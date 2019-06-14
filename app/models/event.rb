class Event < ApplicationRecord
  belongs_to :author
  belongs_to :location

  # validations
  validates :description, presence: true
  validates :body, presence: true
end
