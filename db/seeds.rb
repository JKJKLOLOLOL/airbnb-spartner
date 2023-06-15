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

p "CREATE USERS"

10.times do |index|
  User.create(email: "fake#{index}@gmail.com", password: "123456")
end

p "CREATE LISTINGS"

5.times do
  user = User.all.sample
  2.times do
    Listing.create(name: Faker::Restaurant.name, address: Faker::Address.street_address, description: "Very nice place", max_cap: rand(0..5), user_id: user.id)
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
  status_options = ['Accepeted', 'Pending', 'Rejected']
  Reservation.create(start_date: start, end_date: start + rand(4).days, user:, listing:, status: status_options.sample)
end
