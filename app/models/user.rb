class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :reservations, :listings, :wishlists
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true, uniqueness: true # TO-DO min char
  validates :email,format: { with: /\A.*@.*\.com\z/ } , presence: true, uniqueness: true

end
