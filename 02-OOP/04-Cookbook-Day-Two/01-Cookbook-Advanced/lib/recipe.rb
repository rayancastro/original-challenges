class Recipe
  attr_accessor :name, :description, :prep_time, :difficulty

  def initialize(name, description, prep_time = 0, difficulty = "Very Easy", read = false)
    @name = name
    @description = description
    @prep_time = prep_time
    @difficulty = difficulty
    @read = read
  end
end
