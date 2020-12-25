class Post < ApplicationRecord
  validates :title, length: { minimum: 1, maximum: 80 }
  validates :body, length: { minimum: 1, maximum: 1200 }
  belongs_to :member
end
