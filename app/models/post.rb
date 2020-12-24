class Post < ApplicationRecord
  validates :body, length: { minimum: 1, maximum: 1200 }
  belongs_to :member
end
