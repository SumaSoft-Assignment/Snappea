# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
category = ['Entree', 'Appetizer', 'Dessert', 'Beverage', 'Side']

category.each { |q| Category.create!(name: q) }

menu = [{ name: 'Grilled Amish Chicken', category_id: 1},
        {name: 'Vegetable Orecchiette', category_id: 1},
        { name: 'Jumbo Shrimp Cocktail', category_id: 2},
        { name: 'Mushroom Cavatelli', category_id: 2},
        { name: 'Chocolate Crunch Bar', category_id: 3},
        { name: 'Apple Crumb Tart', category_id: 3},
        { name: 'Moccha', category_id: 4},
        {name: 'Hot Chocolate', category_id: 4}]
menu.each {|m| Menu.create!({name: m[:name],
                             description: Faker::Lorem.sentences,
                             category_id: m[:category_id]})}

10.times do |i|
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name

  user = User.create!({ first_name: first_name,
                        last_name: last_name,
                        email: "#{first_name}.#{last_name[0]}@example.com".downcase,
                      })
  user.generate_auth_token
end

10.times do |i|
  restaurant = Restaurant.create!({ name: Faker::Name.name,
                                    description: Faker::Lorem.sentences,
                                    rating: Faker::Number.between(1, 5),
                                    address: Faker::Address.city
                            })
  rand(1..5).times do |i|
    menu = Menu.all.sample
    restaurant.menus.push(menu) if restaurant.menus.exclude?(menu)
  end
end
