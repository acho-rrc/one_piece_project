# app/models/pirate.rb
class Pirate < ApplicationRecord
  belongs_to :crew
  ROLES = ["Captain","First Mate","Navigator","Swordsman","Sniper","Cook","Doctor","Musician","Archaeologist","Helmsman"].freeze

  validates :name, :role, :bounty, presence: true
  validates :role, inclusion: { in: ROLES }
  validates :bounty, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  scope :by_crew, ->(crew_id) { where(crew_id:) if crew_id.present? }
  scope :by_role, ->(role)    { where(role:) if role.present? }
  scope :with_devil_fruit, ->(flag) {
    case flag
    when "yes" then where.not(devil_fruit: [nil, ""])
    when "no"  then where(devil_fruit: [nil, ""])
    end
  }
  scope :bounty_min, ->(min) { where("bounty >= ?", min.to_i) if min.present? }
  scope :bounty_max, ->(max) { where("bounty <= ?", max.to_i) if max.present? }

  scope :search, ->(q) {
    if q.present?
      pattern = "%#{ApplicationRecord.sanitize_sql_like(q)}%"
      where(
        "pirates.name ILIKE :q OR pirates.role ILIKE :q OR pirates.devil_fruit ILIKE :q",
        q: pattern
      )
    end
  }

  scope :by_bounty_desc, -> { order(bounty: :desc) }
end
