class Tier < ApplicationRecord
    belongs_to :creator
    validate :title, :description, :amount, presence: true
end
