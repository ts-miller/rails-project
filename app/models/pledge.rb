class Pledge < ApplicationRecord
    belongs_to :user
    belongs_to :creator
    validates :amount, presence: true
    validates :user_id, uniqueness: { scope: :creator_id, message: 'already have a pledge with this creator' }
end
