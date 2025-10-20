class Crew < ApplicationRecord
  has_one  :ship, dependent: :destroy
  has_many :pirates, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :sea,  presence: true
  validates :island, presence: true
end
