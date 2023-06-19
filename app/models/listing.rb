class Listing < ApplicationRecord
  belongs_to :user
  has_many :reservations
  has_many :wishlists, through: :favourites
  has_many_attached :photos
 # geocoded_by :address
  #after_validation :geocode, if: :will_save_change_to_address?

  validates :name, :address, :description, :max_cap, presence: true # Todo min lenghth perhaps
end
