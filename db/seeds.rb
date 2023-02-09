# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "faker"

puts "Destroying records"

User.destroy_all
Yacht.destroy_all
Booking.destroy_all

i = 0
10.times do
  puts "Creating user #{i}"
  user = User.new(
    email: "#{i}@gmail.com",
    first_name: "name",
    last_name: "lastname",
    password: "123456"
  )
  user.save!
  puts "Creating user's Yacht"
  Yacht.create(
    name: Faker::Music.mambo_no_5,
    length: Faker::Number.within(range: 2.0..30.0), description: Faker::Quote.robin,
    price: Faker::Number.within(range: 50.0..5000000.0),
    user: user
  ).save!
  i += 1
end

puts "Seeding Finished"
