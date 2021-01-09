class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, dependent: :destroy
  has_many :comments
  has_many :memberships, dependent: :destroy
  has_many :forums, through: :memberships
  has_many :administered_forums, class_name: :Forum

  validates :name, :username, presence: true
  validates :username, uniqueness: true
end
