class Ship < ApplicationRecord
  belongs_to :crew
  validates :name, presence: true, uniqueness: true
  validates :location, presence: true
  validates :crew_id, uniqueness: true
end
