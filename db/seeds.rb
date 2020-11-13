# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'

Ingredient.delete_all

url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
ingredients_url = open(url).read 
ingredients = JSON.parse(ingredients_url)

ingredients["drinks"].each do |ingredient|
    Ingredient.create(name: ingredient["strIngredient1"])
end

# open("https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list") do |ingredients|
#   data = []
#   ingredients.read.each_line do |ingredient|
#     @item = JSON.parse(ingredient)
#       object = {
#         "strIngredient1": @item["strIngredient1"]
#       }
#       data << object
#     end
#     Ingredient.create!(data)
#   end