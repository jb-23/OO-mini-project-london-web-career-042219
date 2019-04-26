class User

  @@all = []

  def self.all
    @@all
  end

  attr_reader :name

  def initialize(name)
    @name = name
    @@all << self
  end

  def declare_allergy(ingredient)
    Allergy.create(self, ingredient)
  end

  def add_recipe_card(recipe, date, rating)
    RecipeCard.create(self, recipe, date, rating)
  end

  def by_user(klass)
    klass.by_user(self).map { |x| x.send(klass.thing) }
  end

  def recipe_cards
    RecipeCard.by_user(self)
  end

  def recipes
    by_user(RecipeCard)
  end

  def allergens
    by_user(Allergy)
  end

  def top_three_recipes
    recipe_cards.max_by(3) { |card| card.rating }.map { | card | card.recipe }
  end

  def most_recent_recipe
    recipe_cards.max_by { |card| card.date }.recipe
  end

  def safe_recipes
    Recipe.all.select do |recipe|
      safe = true
      allergens.each do |allergen|
        if recipe.ingredients.include? (allergen)
          safe = false
        end
      end
      safe
    end
  end

end