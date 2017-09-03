class Post < ApplicationRecord
  validates :title, presence: true, length: { minimum: 5}
  validates_presence_of :body

  has_many :comments, dependent: :destroy
end
