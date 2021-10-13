class Post < ApplicationRecord
  has_many :comments
  validates :title, presence: true, length: {minimum: 4}
  has_rich_text :body

end
