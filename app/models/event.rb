class Event < ApplicationRecord
  belongs_to :author
  belongs_to :location
end
