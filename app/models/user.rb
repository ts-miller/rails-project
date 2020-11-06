class User < SuperUser
    has_many :pledges
    has_many :creators, through: :pledges
end
