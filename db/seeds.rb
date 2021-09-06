# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

RealEstate.destroy_all
User.destroy_all

10.times do
  u = User.create(email: Faker::Internet.email, password: Faker::Internet.password)
end

30.times do
  re = RealEstate.create(title: Faker::Space.galaxy, description: Faker::Lorem.paragraph_by_chars(number: 256), address: Faker::Address.full_address, location: Faker::Address.city, price: Faker::Number.number(digits: 8), user: User.all.sample())
end