class User < ApplicationRecord
  has_secure_password

  validates :email, uniqueness: true
  validates_presence_of :email, :username, :password_digest
end
