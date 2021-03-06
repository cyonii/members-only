class Post < ApplicationRecord
  validates :title, length: { minimum: 1, maximum: 80 }
  validates :body, length: { minimum: 1, maximum: 1200 }
  belongs_to :author, class_name: 'Member', foreign_key: :member_id
  has_many :comments, dependent: :destroy
end
