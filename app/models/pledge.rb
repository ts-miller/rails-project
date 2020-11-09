class Pledge < ApplicationRecord
    belongs_to :user
    belongs_to :creator
    validates :amount, presence: true
    validates :user_id, uniqueness: { scope: :creator_id, message: 'already have a pledge with this creator' }

    def to_tier
        Tier.find_by(creator_id: self.creator_id, amount: self.amount)
    end

end
