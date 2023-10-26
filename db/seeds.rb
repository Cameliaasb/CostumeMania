require "open-uri"
require 'algoliasearch-rails'

User.destroy_all

user1 = User.new(first_name: "Jack", last_name: "Sparrow", password: "azerty", email: "test@gmail.com")
user2 = User.new(first_name: "Elizabeth", last_name: "Swan", password: "azerty", email: "toto@gmail.com")
user3 = User.new(first_name: "William", last_name: "Turner", password: "azerty", email: "tata@gmail.com")
user4 = User.new(first_name: "Hector", last_name: "Barbossa", password: "azerty", email: "tutu@gmail.com")
user5 = User.new(first_name: "James", last_name: "Norington", password: "azerty", email: "titi@gmail.com")
user6 = User.new(first_name: "Davy", last_name: "Jones", password: "azerty", email: "tete@gmail.com")

puts "Loading images"
file1 = URI.open("https://images.unsplash.com/photo-1635634429269-baa64e5f52b9?")
file2 = URI.open("https://insertface.com/fb/860/cinderella-costume-adult-859685-h5jfm-fb.jpg")
file3 = URI.open("https://i.pinimg.com/474x/ca/ab/90/caab909743bdf208ef9af83c21a8ab43.jpg")
file4 = URI.open("https://images.unsplash.com/photo-1547355332-7c6fcb397868?")
file5 = URI.open("https://images.pexels.com/photos/3526020/pexels-photo-3526020.jpeg")
file6 = URI.open("https://images.pexels.com/photos/2116142/pexels-photo-2116142.jpeg")
file7 = URI.open("https://images.pexels.com/photos/14143638/pexels-photo-14143638.jpeg")
file8 = URI.open("https://images.pexels.com/photos/12654811/pexels-photo-12654811.jpeg")
file9 = URI.open("https://images.pexels.com/photos/7180662/pexels-photo-7180662.jpeg")
file10 = URI.open("https://images.pexels.com/photos/3149862/pexels-photo-3149862.jpeg")
file11 = URI.open("https://images.unsplash.com/photo-1568417858195-270566c8656d?")
file12 = URI.open("https://images.pexels.com/photos/6658693/pexels-photo-6658693.jpeg")
file13 = URI.open("https://images.pexels.com/photos/14346784/pexels-photo-14346784.jpeg")
puts "Finished loading images"

Costume.destroy_all

puts "Creating costumes"
costume1 = Costume.new(
  name: 'Spider Man', size: "S",
  condition: Costume::CONDITION.sample, price: 10, owner: user3, gender: "unisex",
  description: "Dynamic Spider-Man suit: iconic red and blue, webbed design,
  muscle definition. Perfect for parties, events, and superhero fun."
)
costume1.photo.attach(io: file1, filename: "spider-man.png", content_type: "image/jpg")
costume1.save

costume2 = Costume.new(
  name: 'Cinderella', size: "XS",
  condition: Costume::CONDITION.sample, price: 14, owner: user3, gender: "women",
  description: "Elegant Cinderella gown: enchanting blue, delicate details,
  flowing skirt. Ideal for events, parties, and magical moments."
)
costume2.photo.attach(io: file2, filename: "cinderella.png", content_type: "image/jpg")
costume2.save

costume3 = Costume.new(
  name: 'Pirate', size: "L",
  condition: Costume::CONDITION.sample, price: 12, owner: user1, gender: "men",
  description: "Authentic pirate ensemble: tricorn hat, billowy shirt,
  weathered vest, tattered pants, boots, eyepatch, bandana, prop swords & treasure accents.
   High-quality, versatile, perfect for costumes, events, and parties."
)
costume3.photo.attach(io: file3, filename: "pirate.png", content_type: "image/jpg")
costume3.save

costume4 = Costume.new(
  name: 'Batman', size: "XL",
  condition: Costume::CONDITION.sample, price: 10, owner: user1, gender: "men",
  description: "Sleek Batman costume: black, cape, emblem, utility belt.
  Ideal for parties, events, and superhero gatherings."
)
costume4.photo.attach(io: file4, filename: "batman.png", content_type: "image/jpg")
costume4.save

costume5 = Costume.new(
  name: 'Chewbacca', size: Costume::SIZE.sample,
  condition: Costume::CONDITION.sample, price: 14, owner: user4, gender: "unisex",
  description: "Roar into the galaxy with this amazing Chewbacca Wookiee costume.
  Channel the legendary Wookiee from the Star Wars universe and become a beloved
  character from a galaxy far, far away. With a mask that perfectly captures Chewie's
  expressive features, you'll be ready for any intergalactic adventure, cosplay event,
  or themed party. Join the ranks of Star Wars enthusiasts and make a statement with
  this remarkable Chewbacca costume."
)
costume5.photo.attach(io: file5, filename: "chewbaca.png", content_type: "image/jpg")
costume5.save

costume6 = Costume.new(
  name: 'Mermaid', size: Costume::SIZE.sample,
  condition: Costume::CONDITION.sample, price: 20, owner: user5, gender: "women",
  description: "Enchanting mermaid attire: iridescent scales, flowing tail,
  seashell accents. Ideal for events, parties, and fantasy themes."
)
costume6.photo.attach(io: file6, filename: "mermaid.png", content_type: "image/jpg")
costume6.save

costume7 = Costume.new(
  name: 'Futuristic Soldier', size: Costume::SIZE.sample,
  condition: Costume::CONDITION.sample, price: 1, owner: user1, gender: "men",
  description: "Step into a dystopian future with this captivating Futuristic Soldier with Sword
  costume. This ensemble is perfect for those who are ready to embark on an intergalactic
  adventure or face post-apocalyptic challenges. Ideal for science fiction
  conventions, cosplay events, or any occasion where you want to embody a fierce and enigmatic
  warrior of the future. Embrace your inner hero or antihero and stand out in this captivating
  and otherworldly costume."
)
costume7.photo.attach(io: file7, filename: "soldier.png", content_type: "image/jpg")
costume7.save

costume8 = Costume.new(
  name: 'Dia de los Muertos Men', size: "L",
  condition: Costume::CONDITION.sample, price: 13, owner: user1, gender: "men",
  description: "Embrace the vibrant and festive spirit of Dia de los Muertos with this
  striking costume designed for men. Perfect for celebrating the
  Day of the Dead, Halloween parties, or cultural events, this costume lets you honor
  this beloved tradition with style and authenticity. Stand out and immerse yourself in
  the rich heritage of Dia de los Muertos with this captivating costume for men."
)
costume8.photo.attach(io: file8, filename: "muertos.png", content_type: "image/jpg")
costume8.save

costume9 = Costume.new(
  name: 'Alien', size: "M",
  condition: Costume::CONDITION.sample, price: 20, owner: user2, gender: "women",
  description: "Enter a world beyond the stars with this exquisite Beautiful Alien costume
  designed exclusively for women. The costume is adorned with celestial patterns and cosmic embellishments that make you look like a being from
  another dimension. Perfect for science fiction parties, space-themed
  events, or simply when you want to stand out and showcase your unique, interstellar style.
  Embrace your inner extraterrestrial beauty with this captivating alien costume."
)
costume9.photo.attach(io: file9, filename: "alien.png", content_type: "image/jpg")
costume9.save

costume10 = Costume.new(
  name: 'Santa', size: "XXL",
  condition: Costume::CONDITION.sample, price: 12, owner: user5, gender: "unisex",
  description: "Spread joy and holiday cheer with this classic Santa Claus costume.
  Embody the spirit of Christmas and become the beloved symbol of generosity and
  merriment. Whether you're playing Santa at a Christmas party, participating in a festive parade, or surprising children
  on Christmas Eve, this costume will make you the center of the holiday festivities."
)
costume10.photo.attach(io: file10, filename: "santa.png", content_type: "image/jpg")
costume10.save

costume11 = Costume.new(
  name: 'Joker', size: "M",
  condition: Costume::CONDITION.sample, price: 16, owner: user6, gender: "unisex",
  description: "Unleash chaos and madness with this classic Joker costume,
  paying homage to the legendary DC Comics character. The costume includes a
  purple pinstripe suit, a green vest, a wild card bowtie, and the signature
  Joker makeup kit. Perfect for Halloween, costume parties, or cosplay events,
  this outfit lets you step into the shoes of the Clown Prince of Crime and
  embrace your inner jester of anarchy."
)
costume11.photo.attach(io: file11, filename: "joker.png", content_type: "image/jpg")
costume11.save

costume12 = Costume.new(
  name: 'Enchanting Forest Fairy', size: "L",
  condition: Costume::CONDITION.sample, price: 15, owner: user6, gender: "women",
  description: "This outfit transports you to an ethereal woodland with its flowing
  and shimmering emerald green gown, adorned with delicate floral accents. The costume
  also includes intricate fairy wings that glisten in the moonlight, and a crown of
  flowers to complete your fairy transformation. Ideal for fantasy-themed parties,
  Halloween, or any occasion where you want to bring a touch of enchantment to life."
)
costume12.photo.attach(io: file12, filename: "fairy.png", content_type: "image/jpg")
costume12.save

costume13 = Costume.new(
  name: 'Dia de los Muertos', size: "S",
  condition: Costume::CONDITION.sample, price: 17, owner: user2, gender: "women",
  description: "Embrace the spirit of Dia de los Muertos with this stunning costume for women.
  This exquisite outfit features a vibrant and intricately designed sugar skull mask, a colorful
  embroidered dress with traditional motifs, and a beautiful veil. Perfect for celebrating the
  Day of the Dead, Halloween parties, or cultural events. Stand out and honor this beloved
  Mexican tradition in style with this captivating costume."
)
costume13.photo.attach(io: file13, filename: "dia_muertos.png", content_type: "image/jpg")
costume13.save

Costume.reindex!
