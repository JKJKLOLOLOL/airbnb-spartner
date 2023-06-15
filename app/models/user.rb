class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :reservations
  has_many :wishlists
  has_many :listings
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email,format: { with: /\A.*@.*\.com\z/ } , presence: true, uniqueness: true

end
