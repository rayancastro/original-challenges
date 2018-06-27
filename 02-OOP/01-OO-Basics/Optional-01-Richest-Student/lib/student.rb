class Student
  attr_reader :name

  include Comparable
  def <=>(other)
    wealth <=> other.wealth
  end

  def initialize(name, fives, tens, twenties)
    @name = name
    @fives = fives
    @tens = tens
    @twenties = twenties
  end

  def wealth
    return @fives * 5 + @tens * 10 + @twenties * 20
  end
end
