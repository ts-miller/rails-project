class User < ApplicationRecord
    has_many :pledges
    has_many :creators, through: :pledges
    validates :email, :name, presence: :true
    validates :email, uniqueness: { case_sensitive: false }
    has_secure_password
end
