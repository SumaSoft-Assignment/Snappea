FactoryGirl.define do
  factory :restaurant do
    name Faker::Name.name
    rating 5
    description Faker::Lorem.sentences
  end
end