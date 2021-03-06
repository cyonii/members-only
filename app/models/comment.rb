class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :member

  validates :text, length: { minimum: 3, maximum: 256 }
  default_scope { order(created_at: :desc) }
end
