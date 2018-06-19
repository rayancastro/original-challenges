require_relative "coach_answer"
# TODO: Implement the program that makes you discuss with your coach from the terminal.
def ask_message
  puts "Enter your message to the coach."
  return gets.chomp.to_s
end

message = ask_message

until coach_answer_enhanced(message).empty?
  puts(coach_answer_enhanced(message))
  message = ask_message
end
