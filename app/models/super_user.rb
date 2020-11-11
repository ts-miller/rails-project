class SuperUser < ApplicationRecord
    self.abstract_class = true
    validates :name, :email, presence: true
    validates :name, length: { minimum: 2 }
    validates :password, length: { in: 6..20 }, on: :create
    validates_confirmation_of :password
    has_secure_password
    validates :email, uniqueness: { case_sensitive: false }

    def self.from_omniauth(auth)
        where(uid: auth.uid).first_or_create do |user|
            user.name = auth.info.name
            user.uid = auth.uid
            user.email = auth.info.email
            user.password = SecureRandom.hex
        end
    end
end