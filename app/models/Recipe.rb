class Recipe

  @@all = []

  def self.all
    @@all
  end

  attr_reader :title

  def initialize(title, ingredients)
    @title = title
    #ingredients.each { |i| RecipeIngredient.new(self, i) }
    add_ingredients(ingredients)
    @@all << self
  end

  def add_ingredients(ingredients)
    ingredients.each { |i| RecipeIngredient.new(self, i) }
  end

  def self.most_popular
    temp = RecipeCard.all.group_by { |card| card.recipe }     # temp = hash
    temp.each { |recipe, cards| temp[recipe] = cards.count }  # temp = hash
    temp.max_by { |recipe, count| count }[0]
  end

  def users
    RecipeCard.by_recipe(self).map { |card| card.user }
  end

  def ingredients
    RecipeIngredient.by_recipe(self).map { |ri| ri.ingredient }
  end

  def allergens
    ingredients.select { |ingredient| Allergy.by_ingredient(ingredient).count > 0 }
  end

  def allergens_by_user(user)
    #allergens.select { |allergen|
    #ingredients.select { |ingredient| Allergy.by_ingredient(ingredient).count > 0 }
    #allergens
  end

end