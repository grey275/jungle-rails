class Review < ActiveRecord::Base
  validates :rating, presence: true
  belongs_to :user
  belongs_to :product

  def self.reviews_for_product(id)
    Review.where(id: id)
  end

end
