class Owner
  attr_reader :name, :species
  @@owners = []

  def initialize(name)
    @name = name
    @species = "human"
    @@owners << self
  end

  def say_species
    "I am a #{self.species}."
  end

  def cats
    Cat.all.select{|cat| cat.owner == self}
  end

  def dogs
    Dog.all.select{|dog| dog.owner == self}
  end

  def buy_cat(name)
    cat = Cat.new(name, self)
  end

  def buy_dog(name)
    dog = Dog.new(name, self)
  end

  def walk_dogs
    self.dogs.each{ |dog| dog.mood = "happy" }
  end

  def feed_cats
    self.cats.each{ |cat| cat.mood = "happy" }
  end

  def sell_pets
    pets = self.cats + self.dogs

    pets.each do |pet|
      pet.mood = "nervous"
      pet.owner = nil
    end
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

  def self.all
    @@owners
  end

  def self.count
    @@owners.count
  end

  def self.reset_all
    @@owners.clear
  end 

end
