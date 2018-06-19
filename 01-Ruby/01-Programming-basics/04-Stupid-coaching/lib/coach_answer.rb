def coach_answer(your_message)
  # TODO: return coach answer to your_message
  if your_message == "I am going to work right now!"
    return ""
  end

  if your_message.strip.end_with?("?")
    return "Silly question, get dressed and go to work!"
  else
    return "I don't care, get dressed and go to work!"
  end
end

def coach_answer_enhanced(your_message)
  # TODO: return coach answer to your_message, with additional custom rules of yours!
  if your_message == "I AM GOING TO WORK RIGHT NOW!"
    return ""
  else if your_message.upcase?
    puts "I can feel your motivation!"
    return coach_answer(your_message)
  end
end
