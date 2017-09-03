class User < ApplicationRecord
  has_secure_password

  validates :email, uniqueness: true
  validates_presence_of :email, :username, :password_digest
  validates_presence_of :password_confirmation, if: :password_changed?

end
