class RecipeCard

  @@all = []

  def self.all
    @@all
  end

  @@thing = :recipe

  def self.thing
    @@thing
  end

  attr_reader :date, :rating, :user, :recipe

  def initialize(user, recipe, date, rating)
    @user = user
    @recipe = recipe
    @date = Date.strptime(date, '%d/%m/%y')
    @rating = rating
    @@all << self
  end

  def self.create(user, recipe, date, rating)
    if by_user(user).find { |card| card.recipe == recipe }
      puts "recipe already on card"
      return
    end
    new(user, recipe, date, rating)
  end

  # returns the recipe cards for specific user
  def self.by_user(user)
    all.select { |card| card.user == user }
  end

  def self.by_recipe(recipe)
    all.select { |card| card.recipe == recipe }
  end

end