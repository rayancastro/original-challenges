class OrangeTree
  # TODO: Implement all the specs defined in the README.md :)
  attr_reader :age
  attr_reader :height
  attr_accessor :fruits

  def initialize
    puts "A new orange tree is born..."
    @age = 0
    @height = 0
    @fruits = 0
    @dead = false
  end

  def dead?
    return @dead
  end

  def survival
    survival_rate = (@age - 50) * 2
    # puts "Your survival rate is #{survival_rate}%" if @age > 50 && @dead == false
    if @age > 50 && rand(survival_rate..100) == 100
      @dead = true
      puts "Your tree has died."
    else
      return true
    end
  end

  def pick_a_fruit!
    @fruits -= 1 if @fruits > 0
  end

  def one_year_passes!
    # TODO: age the tree by one year
    survival
    return "Your tree is dead." if @dead == true
    # puts "One year have passed..."
    @age += 1
    # puts "The tree is #{@age} years old"
    # TODO: check if the tree has survived
    # puts "Yay! The orange tree lives!"
    # TODO: if so, make the tree height grow
    @height += 1 if @age <= 10
    # puts "It's now #{@height}m tall!"
    # TODO: if so, make the tree grow fruits
    # "A total of #{@fruits} have fell off"
    @fruits = 0
    @fruits = 100 if (@age > 5) && (@age < 10)
    @fruits = 200 if (@age >= 10) && (@age < 15)
  end
end
