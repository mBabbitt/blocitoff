# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'
#create users
 user = User.new(
     name: 'Tyler',
     email:    'tyler@example.com',
     password: 'helloworld'
  )
  user.skip_confirmation!
  user.save!

   user = User.new(
     name: 'Amy',
     email:    'amy@example.com',
     password: 'helloworld'
  )
  user.skip_confirmation!
  user.save!


#create items
5.times do
  Item.create!(
   name: Faker::Lorem.sentence,
   user: user
   )
end