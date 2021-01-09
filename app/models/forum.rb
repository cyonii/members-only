class Forum < ApplicationRecord
  belongs_to :admin, class_name: :User, foreign_key: :user_id
  has_many :posts, dependent: :destroy
  has_many :memberships, dependent: :destroy
  has_many :members, through: :memberships, source: :user

  validates :name, :description, presence: true
end
