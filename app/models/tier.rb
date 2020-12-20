class Tier < ApplicationRecord
    belongs_to :creator
    validates :title, :description, :amount, presence: true
    validates :title, uniqueness: { scope: :creator_id, message: 'title already taken', case_sensitive: false }
    validates :amount, uniqueness: { scope: :creator_id, message: 'tier amount already taken' }
    # default_scope { order(created_at: :desc).limit(9)}
    scope :most_expensive_9, -> { reorder(amount: :desc) }
end
