class Tier < ApplicationRecord
    belongs_to :creator
    validate :title, :description, :amount, presence: true
    validate :title, uniqueness: { scope: :creator_id, message: 'title already taken' }
    validate :amount, uniqueness: { scope: :creator_id, :message: 'tier amount already taken' }
end
