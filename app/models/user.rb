class User < ApplicationRecord
    has_many :pledges
    has_many :creators, through: :pledges
    validates :email, :name, presence: :true
    validates :email, uniqueness: { case_sensitive: false }
    has_secure_password

    def self.from_omniauth(auth)
        where(uid: auth.uid).first_or_create do |user|
            user.name = auth.info.name
            user.uid = auth.uid
            user.email = auth.info.email
            user.password = SecureRandom.hex
        end
    end
end
