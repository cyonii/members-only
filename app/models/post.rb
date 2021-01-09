class Post < ApplicationRecord
  validates :title, length: { minimum: 1, maximum: 80 }
  validates :body, length: { minimum: 1, maximum: 1200 }
  belongs_to :author, class_name: 'User', foreign_key: :user_id
  has_many :comments, dependent: :destroy
end
