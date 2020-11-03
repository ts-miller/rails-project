class Creator < ApplicationRecord
    has_many :pledges
    has_many :users, through: :pledges
    validates :name, :email, :about, presence: true
    validates :email, uniqueness: { case_sensitive: false }
    has_secure_password
    validates_confirmation_of :password

end
