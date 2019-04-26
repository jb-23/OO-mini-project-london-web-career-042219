class Ingredient

  @@all = []

  def self.all
    @@all
  end

  attr_reader :name

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.most_common_allergen
    temp = Allergy.all.group_by { |a| a.ingredient }     # temp = hash
    temp.each { |ingredient, allergies| temp[ingredient] = allergies.count }  # temp = hash
    temp.max_by { |ingredient, count| count }[0]
  end

end
