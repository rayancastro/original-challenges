class Mother
  def self.descendants
    ObjectSpace.each_object(Class).select { |object| object < self }
  end

  def self.phone_kids
    descendants.each { |element| element.phone }
  end
end

# Daughter and Son are classes inheriting from Mother. They are defined
# in the specs, no need to create them.
