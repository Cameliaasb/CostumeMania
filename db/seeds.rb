# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"
User.destroy_all

user1 = User.new(first_name: "Jack", last_name: "Sparrow", password: "azerty", email: "test@gmail.com")
user2 = User.new(first_name: "Elisabeth", last_name: "Swan", password: "azerty", email: "toto@gmail.com")

file1 = URI.open("https://cdn.beebs.app/19180292-b886-40a4-9369-13557aef845f.jpg")
puts "image fonctionne"
file2 = URI.open("https://m.media-amazon.com/images/I/616zPKTFMUL._AC_UY780_.jpg")
puts "image fonctionne"
file3 = URI.open("https://cdn.webshopapp.com/shops/284974/files/356877679/great-pretenders-deguisement-pirate-corsaire.jpg")
puts "image fonctionne"
file4 = URI.open("https://newcossky.fr/cdn/shop/products/d251aabe01d5f69c9e2993a2b026ec34.jpg?v=1657607116")
puts "image fonctionne"
file5 = URI.open("https://static.smallable.com/811641-720x720q80/costume-de-docteur-avec-ses-accessoires.jpg")
puts "image fonctionne"
file6 = URI.open("https://img1.miccostumes.com/path-products/image-CTLM306A.jpg/&width=600&height=880&original=77s8AgZSGN6A")
puts "image fonctionne"
file7 = URI.open("https://cdn.s7.shopdisney.eu/is/image/DisneyStoreES/2844045240212M?fmt=webp&qlt=70&wid=1304&hei=1304")
puts "image fonctionne"
file8 = URI.open("https://lestresorsdeloulette.fr/wp-content/uploads/2021/10/deguisement-pompier-avec-accessoires-56-ans.jpeg")
puts "image fonctionne"
file9 = URI.open("https://newcossky.fr/cdn/shop/products/ef405df6fa0d3479aa2c18d209d5600b.jpg?v=1656913505")
puts "image fonctionne"
file10 = URI.open("https://www.events-tour.com/medias/images/costume-adulte-halloween-taille-s-m-spectre-fantome.jpg")
puts "image fonctionne"
file11 = URI.open("https://www.deguisement-mania.fr/wp-content/uploads/2020/09/Deguisement-princesse-Vaiana-Moana-adulte.jpg")
puts "image fonctionne"
file12 = URI.open("https://cdn.media.amplience.net/i/partycity/P889705?$large$&fmt=auto&qlt=default")
puts "image fonctionne"

Costume.destroy_all

costume1 = Costume.new(name: 'Spider Man Costume', size: Costume::SIZE.sample, condition: Costume::CONDITION.sample, price: 3, owner: user1, age: "Kids", gender: "Unisex", description: "Dynamic Spider-Man suit: iconic red and blue, webbed design, muscle definition. Perfect for parties, events, and superhero fun.")
costume1.photo.attach(io: file1, filename: "spider-man.png", content_type: "image/jpg")
costume1.save

costume2 = Costume.new(name: 'Cinderella Costume', size: Costume::SIZE.sample, condition: Costume::CONDITION.sample, price: 1, owner: user1, age: "Kids", gender: "Women", description: "Elegant Cinderella gown: enchanting blue, delicate details, flowing skirt. Ideal for events, parties, and magical moments.")
costume2.photo.attach(io: file2, filename: "cinderella.png", content_type: "image/jpg")
costume2.save

costume3 = Costume.new(name: 'Pirate Costume', size: Costume::SIZE.sample, condition: Costume::CONDITION.sample, price: 2, owner: user1, age: "Kids", gender: "Men", description: "Authentic pirate ensemble: tricorn hat, billowy shirt, weathered vest, tattered pants, boots, eyepatch, bandana, prop swords & treasure accents. High-quality, versatile, perfect for costumes, events, and parties.")
costume3.photo.attach(io: file3, filename: "pirate.png", content_type: "image/jpg")
costume3.save

costume4 = Costume.new(name: 'Batman Costume', size: Costume::SIZE.sample, condition: Costume::CONDITION.sample, price: 4, owner: user1, age: "Adults", gender: "Men", description: "Sleek Batman costume: black, cape, emblem, utility belt. Ideal for parties, events, and superhero gatherings.")
costume4.photo.attach(io: file4, filename: "batman.png", content_type: "image/jpg")
costume4.save

costume5 = Costume.new(name: 'Doctor Costume', size: Costume::SIZE.sample, condition: Costume::CONDITION.sample, price: 4, owner: user1, age: "Kids", gender: "Unisex", description: "Classic doctor ensemble: white coat, stethoscope, scrubs. Perfect for parties, events, and roleplay.")
costume5.photo.attach(io: file5, filename: "doctor.png", content_type: "image/jpg")
costume5.save

costume6 = Costume.new(name: 'Mermaid Costume', size: Costume::SIZE.sample, condition: Costume::CONDITION.sample, price: 2, owner: user2, age: "Adults", gender: "Women", description: "Enchanting mermaid attire: iridescent scales, flowing tail, seashell accents. Ideal for events, parties, and fantasy themes.")
costume6.photo.attach(io: file6, filename: "mermaid.png", content_type: "image/jpg")
costume6.save

costume7 = Costume.new(name: 'Iron man Costume', size: Costume::SIZE.sample, condition: Costume::CONDITION.sample, price: 5, owner: user1, age: "Kids", gender: "Men", description: "Dynamic Iron Man suit: metallic red and gold, arc reactor, detailed armor. Perfect for parties, events, and superhero experiences.")
costume7.photo.attach(io: file7, filename: "iron-man.png", content_type: "image/jpg")
costume7.save

costume8 = Costume.new(name: 'Fireman Costume', size: Costume::SIZE.sample, condition: Costume::CONDITION.sample, price: 3, owner: user1, age: "Kids", gender: "Men", description: "Authentic firefighter gear: yellow coat, reflective stripes, helmet, tools. Ideal for events, parties, and heroic roleplay.")
costume8.photo.attach(io: file8, filename: "fireman.png", content_type: "image/jpg")
costume8.save

costume9 = Costume.new(name: 'Thor Costume', size: Costume::SIZE.sample, condition: Costume::CONDITION.sample, price: 7, owner: user2, age: "Adults", gender: "Men", description: "Unique Fireman Thor fusion: Mjolnir-themed axe, firefighter outfit with cape. Perfect for creative events, parties, and memorable moments")
costume9.photo.attach(io: file9, filename: "thor.png", content_type: "image/jpg")
costume9.save

costume10 = Costume.new(name: 'Ghost Costume', size: Costume::SIZE.sample, condition: Costume::CONDITION.sample, price: 4, owner: user2, age: "Adults", gender: "Unisex", description: "Ethereal ghost attire: flowing white gown, pale makeup, haunting aura. Ideal for spooky events, parties, and ghostly themes.")
costume10.photo.attach(io: file10, filename: "ghost.png", content_type: "image/jpg")
costume10.save

costume11 = Costume.new(name: 'Moana Costume', size: Costume::SIZE.sample, condition: Costume::CONDITION.sample, price: 5, owner: user2, age: "Adults", gender: "Women", description: "Adventure-ready Moana costume: tropical dress, necklace, adventurous spirit. Perfect for events, parties, and Disney-themed fun.")
costume11.photo.attach(io: file11, filename: "moana.png", content_type: "image/jpg")
costume11.save

costume12 = Costume.new(name: 'Skull king Costume', size: Costume::SIZE.sample, condition: Costume::CONDITION.sample, price: 7, owner: user2, age: "Adults", gender: "Unisex", description: "Regal Skull King costume: ornate crown, dark robes, skeletal accents. Ideal for themed events, parties, and dramatic flair.")
costume12.photo.attach(io: file12, filename: "skull_king.png", content_type: "image/jpg")
costume12.save
