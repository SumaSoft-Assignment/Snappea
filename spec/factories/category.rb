FactoryGirl.define do
  factory :entree, class: :category do
    name 'Entree'
  end

  factory :appetizer, class: :category do
    name 'Appetizer'
  end

  factory :dessert, class: :category do
    name 'Dessert'
  end

  factory :beverage, class: :category do
    name 'Beverage'
  end
end