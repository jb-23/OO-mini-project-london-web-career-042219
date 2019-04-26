require_relative '../config/environment.rb'

john = User.new("John")
john1 = User.new("John1")
john2 = User.new("John2")
john3 = User.new("John2")


water = Ingredient.new("water")
flour = Ingredient.new("flour")
parsley = Ingredient.new("parsley")

john.declare_allergy(parsley)
john.declare_allergy(parsley)

john1.declare_allergy(parsley)
john1.declare_allergy(flour)

john2.declare_allergy(flour)
john3.declare_allergy(flour)



bread = Recipe.new("Bread", [water, flour])
scones = Recipe.new("Scones", [water, flour])
cake = Recipe.new("Cake", [water, flour])
tortilla = Recipe.new("Tortilla", [water, flour, parsley])
pastry = Recipe.new("Pastry", [water, flour])

john.add_recipe_card(bread, "6/04/19", 2)
john.add_recipe_card(scones, "16/04/19", 7)
john.add_recipe_card(cake, "29/04/19", 5)
john.add_recipe_card(tortilla, "24/04/19", 3)
john.add_recipe_card(pastry, "26/04/19", 9)
john.add_recipe_card(cake, "21/04/19", 5)


john1.add_recipe_card(bread, "6/04/19", 2)
john1.add_recipe_card(scones, "16/04/19", 7)
john1.add_recipe_card(cake, "29/04/19", 5)

john2.add_recipe_card(pastry, "26/04/19", 9)
john2.add_recipe_card(cake, "21/04/19", 5)
john2.add_recipe_card(cake, "29/04/19", 5)



binding.pry
