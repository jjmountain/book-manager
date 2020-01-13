# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts 'Destroying Users and Books'

User.destroy_all
Book.destroy_all

puts 'Books and Users destroyed'

puts 'Creating Users'

5.times do
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    balance: (rand(30) + rand.floor(2))
  )
end

puts 'Users created!'

puts 'Creating 10 books'

10.times do 
  Book.create(
    title: Faker::Book.title,
    author: Faker::Book.author,
    quantity: rand(11),
    rental_fee: 3.00
  )
end

puts 'Books created!'