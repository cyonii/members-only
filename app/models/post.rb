class Post < ApplicationRecord
  validates :title, length: { minimum: 1, maximum: 80 }
  validates :body, length: { minimum: 1, maximum: 256 }

  belongs_to :author, class_name: 'User', foreign_key: :user_id
  belongs_to :forum
  has_many :comments, dependent: :destroy
end
