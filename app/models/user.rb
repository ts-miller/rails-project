class User < SuperUser
    has_many :pledges
    has_many :creators, through: :pledges


    def pledge_amount(creator)
        self.pledges.select { |p| p.creator_id == creator.id }.first.amount
    end
end
