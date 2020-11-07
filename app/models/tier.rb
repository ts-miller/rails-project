class Tier < ApplicationRecord
    belongs_to :creator
    validates :title, :description, :amount, presence: true
    validates :title, uniqueness: { scope: :creator_id, message: 'title already taken', case_sensitive: false }
    validates :amount, uniqueness: { scope: :creator_id, message: 'tier amount already taken' }
end
