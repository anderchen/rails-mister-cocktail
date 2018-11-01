# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients_serialized = open(url).read
ingredients_hash = JSON.parse(ingredients_serialized)

ingredients_hash['drinks'].each do |key|
  ingredient = Ingredient.new
  ingredient.name = key['strIngredient1']
  ingredient.save
end

10.times do
  cocktail = Cocktail.new
  cocktail.name = Faker::HarryPotter.character
  cocktail.save
end
