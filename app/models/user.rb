class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true

  validates_confirmation_of :password
end
