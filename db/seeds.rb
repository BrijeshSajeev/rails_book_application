# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'faker'

# Ensure your models and uploader are loaded
require_relative '../app/models/user'
require_relative '../app/models/book'
require_relative '../app/uploaders/image_uploader'

15.times do
  author_name = Faker::Name.name
  user = User.create(
    email: Faker::Internet.email,
    password: '111111', # Assuming you have a default password setup
    name: author_name,
    age: Faker::Number.between(from: 18, to: 65),
    sex: ['Male', 'Female', 'Other'].sample,
    # interests: Faker::Lorem.sentence,
    image: File.open('/home/brijesh/Pictures/Untitled.jpeg')
  )

  book = Book.create(
    name: Faker::Book.title,
    year: Faker::Number.between(from: 1900, to: 2023).to_s,
    genre: Faker::Book.genre,
    price: Faker::Commerce.price(range: 100..1000).to_s,
    author: Author.find_or_create_by(name: author_name),
    image: File.open('/home/brijesh/Pictures/Atomic_habits.jpeg')
  )

  puts "Created User: #{user.name}, Book: #{book.name}"

end
