class UberHash
  # Initialize uberhash class
  def method_missing(method, value = nil)
    super if method.nil?
    if method.to_s[-1] == "="
      assign = "@" + method.to_s[0..-2]
      instance_variable_set(assign, value)
    else
      getter = "@" + method.to_s
      return instance_variable_get(getter)
    end
  end
  # first argument is the method called to a symbol
  # Override the method_missing method for my own
  # When someone try to calls a non-existing method
  # Create a new variable dinnamically
  # Allow user to access this new variable
  # And change this variable value
end



# uber = UberHash.new
# uber.color = "red"
# p uber.color
