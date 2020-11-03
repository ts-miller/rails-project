class Pledge < ApplicationRecord
    belongs_to :user
    belongs_to :creator
    validates :amount, presence: true
end
