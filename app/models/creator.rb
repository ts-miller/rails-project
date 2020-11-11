class Creator < SuperUser
    has_many :tiers
    has_many :pledges
    has_many :users, through: :pledges
    scope :state, ->(state) { where("state == ?", state ) }
    validates :about, length: { maximum: 500 }
end
