require 'json'
require 'open-uri'

Cocktail.destroy_all
Ingredient.destroy_all

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingre_serialized = open(url).read
ingredients = JSON.parse(ingre_serialized)

ingredients_array = ingredients['drinks']

ingredients_array.each do |ing|
  ingredient_name = ing['strIngredient1']
  Ingredient.create!(name: ingredient_name)
end

Cocktail.create!(name: 'Caipirinha')
Cocktail.create!(name: 'Bloody Marry')
