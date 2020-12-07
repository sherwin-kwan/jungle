# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Seeding Data ..."

# Helper functions
def open_asset(file_name)
  File.open(Rails.root.join('db', 'seed_assets', file_name))
end

# Only run on development (local) instances not on production, etc.
# unless Rails.env.development? || Rails.env.test?
#   puts "Seeds valid for development or test environments"
#   exit 0
# end

# Let's do this ...

## CATEGORIES

puts "Finding or Creating Categories ..."

cat1 = Category.find_or_create_by! name: 'Maki'
cat2 = Category.find_or_create_by! name: 'Nigiri'
cat3 = Category.find_or_create_by! name: 'Sashimi'
cat4 = Category.find_or_create_by! name: 'Appetizers'
cat5 = Category.find_or_create_by! name: 'Dessert'

## PRODUCTS

puts "Re-creating Products ..."

Product.destroy_all

cat1.products.create!({
  name:  'California Rolls',
  description: '8 per order. Inside-out sushi roll with avocado and imitation crab',
  image: open_asset('01-california-roll.jpg'),
  quantity: 20,
  price: 5.99
})

cat1.products.create!({
  name:  'Red Dragon Rolls',
  description: '8 per order. Specialty shrimp tempura roll with spicy tuna or salmon overlay',
  image: open_asset('02-red-dragon-roll.jpg'),
  quantity: 18,
  price: 8.99
})

cat2.products.create!({
  name:  'Ebi',
  description: 'Shrimp prepared by slicing it open and laying it out flat on top of the rice',
  image: open_asset('03-ebi.jpeg'),
  quantity: 4,
  price: 2.25
})

cat2.products.create!({
  name:  'Tai',
  description: 'The red bream or red snapper, a fish native to the waters of the Pacific off East Asia',
  image: open_asset('04-tai.jpg'),
  quantity: 8,
  price: 2.50
})

cat3.products.create!({
  name:  'Salmon Sashimi',
  description: 'Comes in a set of 3. Fresh off the boat.',
  image: open_asset('05-salmon-sashimi.jpg'),
  quantity: 8,
  price: 5.49
})

cat4.products.create!({
  name:  'Takoyaki',
  description: 'Octopus balls, 10 per serving',
  image: open_asset('06-takoyaki.jpg'),
  quantity: 82,
  price: 9.99
})


cat5.products.create!({
  name:  'Green Tea Ice Cream',
  description: 'A great way to unwind after stuffing yourself!',
  image: open_asset('07-green-tea.png'),
  quantity: 0,
  price: 2.99
})


puts "DONE!"
