class Wishlist < ApplicationRecord
  belongs_to :user
  has_many :listings, through: :favourites

  validates :name, presence: true
end
