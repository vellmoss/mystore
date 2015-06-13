# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Mstore.create  position: 'мясо', price: 12.33, created_at: DateTime.now, updated_at: DateTime.now
Mstore.create  position: 'вино', price: 24.45, created_at: DateTime.now, updated_at: DateTime.now
Mstore.create  position: 'водка', price: 32.32, created_at: DateTime.now, updated_at: DateTime.now
Mstore.create  position: 'tanks', price: 45.11, created_at: DateTime.now - 1.day, updated_at: DateTime.now
Mstore.create  position: 'fish', price: 35.13, created_at: DateTime.now - 1.day, updated_at: DateTime.now
Mstore.create  position: 'money', price: 52.34, created_at: DateTime.now - 2.days, updated_at: DateTime.now - 1.day
Mstore.create  position: 'bananas', price: 33.44, created_at: DateTime.now - 2.days, updated_at: DateTime.now - 1.day
Mstore.create  position: 'skovoroda', price: 45.65, created_at: DateTime.now - 2.days, updated_at: DateTime.now - 1.day
Mstore.create  position: 'pivo', price: 65.33, created_at: DateTime.now - 3.days, updated_at: DateTime.now - 2.days
Mstore.create  position: 'mugik', price: 44.76, created_at: DateTime.now - 3.days, updated_at: DateTime.now - 2.days
Mstore.create  position: 'baba', price: 66.87, created_at: DateTime.now, updated_at: DateTime.now - 2.days
Visit.create  country: 'South Korea', visited_at: DateTime.now - 3.days, load_time: 5.0