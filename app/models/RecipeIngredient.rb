class RecipeIngredient

  @@all = []

  def self.all
    @@all
  end

  attr_reader :recipe, :ingredient

  def initialize(recipe, ingredient)
    @recipe = recipe
    @ingredient = ingredient
    @@all << self
  end

  def self.by_recipe(recipe)
    all.select { |ri| ri.recipe == recipe }
  end

end