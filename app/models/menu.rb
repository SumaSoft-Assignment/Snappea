class Menu < ApplicationRecord
  has_and_belongs_to_many :restaurants
  belongs_to :category
end
