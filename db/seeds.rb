# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Building.create(name:"Test Building")
User.create(first_name:"Admin", admin: true, email:'admin@example.com', password:'password')
Room.create(building_id:1)
