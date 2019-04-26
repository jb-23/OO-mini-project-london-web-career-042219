class Allergy

  @@all = []

  def self.all
    @@all
  end

  @@thing = :ingredient

  def self.thing
    @@thing
  end

  attr_reader :user, :ingredient

  def initialize(user, ingredient)
    @user = user
    @ingredient = ingredient
    @@all << self
  end

  def self.create(user, ingredient)
    if by_user(user).find { |allergy| allergy.ingredient == ingredient }
      puts "allergy already listed"
      return
    end
    new(user, ingredient)
  end

  def self.by_user(user)
    all.select { |a| a.user == user }
  end

  # returns all allergies that are this ingredient
  def self.by_ingredient(i)
    all.select { |a| a.ingredient == i }
  end


end