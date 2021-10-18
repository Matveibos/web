class Post < ApplicationRecord
  has_many :comments
  # has_many :images, service: :azure
  validates :title, presence: true, length: {minimum: 4}
  has_rich_text :body
  belongs_to :user

end
