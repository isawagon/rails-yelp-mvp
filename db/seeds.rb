# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# db/seeds.rb

puts "Cleaning database...#{Restaurant.count} restaurants ... #{Review.count} reviews"
Review.delete_all
Restaurant.delete_all

puts "Creating restaurants..."
kom = { name: 'Kom a la maison', address: '97223 Le Diamant',
      phone_number: '+596010101', category: 'french'}

[kom].each do |attributes|
  restaurant = Restaurant.create!(attributes)
  puts "Created #{restaurant.name}"
end

puts 'Creating 10 fake restaurants...'
10.times do
  restaurant = Restaurant.new(
    name: Faker::Restaurant.name,
    address: "#{Faker::Address.street_address}, #{Faker::Address.city}",
    phone_number: Faker::PhoneNumber,
    category: ['chinese', 'italian', 'japanese', 'french', 'belgian'].sample
  )
  restaurant.save!
  [0, 1, 2].sample.times do
    review = Review.new(
      restaurant_id: restaurant.id,
      rating: [0, 1, 2, 3, 4, 5].sample,
      content: Faker::Restaurant.review
    )
    review.save
  end
end
puts "Finished! #{Restaurant.count} restaurants and #{Review.count} reviews created"
