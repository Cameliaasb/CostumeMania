# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.destroy_all

user1 = User.create!(first_name: "Jack", last_name: "Sparrow", password: "alcoolique", email: "toto@gmail.com")

Costume.destroy_all

Costume.create!(name: 'Spider Man Costume', size: "S", condition: "new", price: 3, owner: user1)
Costume.create!(name: 'Cinderella Costume', size: "M", condition: "used", price: 1, owner: user1)
Costume.create!(name: 'Pirate Costume', size: "L", condition: "average", price: 2, owner: user1)
Costume.create!(name: 'Batman Costume', size: "XL", condition: "new", price: 4, owner: user1)
Costume.create!(name: 'Doctor Costume', size: "M", condition: "new", price: 4, owner: user1)
Costume.create!(name: 'Mermaid Costume', size: "XL", condition: "used", price: 2, owner: user1)
Costume.create!(name: 'Iron man Costume', size: "L", condition: "average", price: 5, owner: user1)
