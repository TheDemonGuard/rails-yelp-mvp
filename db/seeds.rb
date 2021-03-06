# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Destroy all the Restaurants"
Restaurant.destroy_all

puts "Destroy all the Reviews"
Review.destroy_all

100.times do
  tmp_rest = Restaurant.create(
                                name: Faker::Restaurant.name,
                                address: Faker::Address.street_address,
                                phone_number: Faker::PhoneNumber.phone_number,
                                category: ['chinese', 'italian', 'japanese', 'french', 'belgian'].sample
              )

  Review.create(
    rating: rand(0..5),
    content: Faker::Restaurant.review,
    restaurant_id: tmp_rest.id
  )
end

puts "Done..."
