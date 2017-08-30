FactoryGirl.define do
  factory :entree_menu, class: :menu do
    name Faker::Name.name
    description Faker::Lorem.sentences
    association :category, factory: :entree
  end

  factory :appetizer_menu, class: :menu do
    name Faker::Name.name
    description Faker::Lorem.sentences
    association :category, factory: :appetizer
  end

  factory :dessert_menu, class: :menu do
    name Faker::Name.name
    description Faker::Lorem.sentences
    association :category, factory: :dessert
  end

  factory :beverage_menu, class: :menu do
    name Faker::Name.name
    description Faker::Lorem.sentences
    association :category, factory: :beverage
  end
end