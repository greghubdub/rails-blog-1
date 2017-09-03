class User < ApplicationRecord
  has_secure_password

  validates :email, uniqueness: true
  validates_presence_of :email, :username
  validates_presence_of :password_confirmation, if: '!password.nil?'
  validates :password, presence: { on: :create }, length: { minimum: 6 }, confirmation: true

end
