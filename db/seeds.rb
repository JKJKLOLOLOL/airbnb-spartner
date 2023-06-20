# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Reservation.destroy_all
Favourite.destroy_all
Wishlist.destroy_all
Listing.destroy_all
User.destroy_all

p "CREATE USER BOB"
user_bob = User.create(email: "bob@gmail.com", password: "123456")
3.times do
  Wishlist.create(name: Faker::Address.state, user_id: user_bob.id)
end
listing = Listing.create(name: Faker::Restaurant.name, address: Faker::Address.street_address, description: "Bob's", max_cap: rand(1..5), price: rand(60..79), user_id: user_bob.id)
file = URI.open("https://source.unsplash.com/featured/?home")
listing.photos.attach(io: file, filename: "listing#{listing.id}.png", content_type: "image/png")
listing.save!

p "CREATE USERS"
10.times do |index|
  User.create(email: "#{Faker::Name.first_name}@gmail.com", password: "123456")
end

p "CREATE LISTINGS"

5.times do
  user = User.all.sample
  2.times do
   listing = Listing.create(name: Faker::Restaurant.name, address: Faker::Address.street_address, description: "Very nice place", max_cap: rand(1..5), price: rand(60..79), user_id: user.id)
   file = URI.open("https://source.unsplash.com/featured/?home")
    listing.photos.attach(io: file, filename: "listing#{listing.id}.png", content_type: "image/png")
    listing.save!
  end
end

p "CREATE WISHLITS + FAVORITES"

User.all.sample(3).each do |user|
  wishlist = Wishlist.create(name: Faker::Address.state, user:)
  Listing.where.not(user:).sample(2).each { |listing| Favourite.create!(listing:, wishlist:) }
end

p "CREATE RESERVATIONS"

12.times do
  user = User.all.sample
  listing = Listing.where.not(user:).sample
  start = Date.today + rand(28).days
  status_options = ['Accepted', 'Pending', 'Rejected']
  Reservation.create(start_date: start, end_date: start + rand(4).days, user:, number_of_people: rand(1..5), listing:, status: status_options.sample)
end
