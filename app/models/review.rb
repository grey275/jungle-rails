class Review < ActiveRecord::Base
  validates :rating, :user_id, :product_id, presence: true
  belongs_to :user
  belongs_to :product
end
