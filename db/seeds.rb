# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# db/seeds.rb

# puts "Cleaning database..."
# Restaurant.destroy_all

puts "Creating restaurants..."
kom = { name: 'Kom a la maison', address: '97223 Le Diamant',
      phone_number: '+596010101', category: 'french'}

[kom].each do |attributes|
  restaurant = Restaurant.create!(attributes)
  puts "Created #{restaurant.name}"
end
