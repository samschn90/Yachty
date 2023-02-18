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
5.times do
  puts "Creating user #{i}"
  user = User.new(
    email: "#{i}@gmail.com",
    first_name: Faker::TvShows::TwinPeaks.character,
    last_name: Faker::Artist.name,
    password: "123456"
  )
  user.save!
  puts "Creating user's Yacht"
  yacht = Yacht.create(
    name: Faker::Music.mambo_no_5,
    length: Faker::Number.within(range: 2..30), description: Faker::Quote.robin,
    price: Faker::Number.within(range: 0..500),
    user: user
  )
  yacht.save!

  puts "Creating a booking"
  Booking.create(
    start_time: Faker::Date.between(from: '2023-06-01', to: '2023-07-01'),
    end_time: Faker::Date.between(from: '2023-07-02', to: '2023-11-01'),
    user: user,
    yacht: yacht
  ).save!
  i += 1
end

puts "Seeding Finished"
