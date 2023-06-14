class Listing < ApplicationRecord
  belongs_to :user
  has_many :reservations
  has_many :wishlists, through: :favourites

  validates :name, :address, :description, :max_cap, presence: true # Todo min lenghth perhaps
end
