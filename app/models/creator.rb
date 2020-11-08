class Creator < SuperUser
    has_many :tiers
    has_many :pledges
    has_many :users, through: :pledges
    scope :state, ->(state) { where("state == ?", state ) }
end
