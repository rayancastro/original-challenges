require_relative 'black_jack'

def state_of_the_game(player_score, bank_score)
  return "Your score is #{player_score}, bank is #{bank_score}"
end

def end_game_message(player_score, bank_score)
  if player_score > 21 || player_score < bank_score
    return "You lost"
  elsif player_score == bank_score
    return "Push"
  elsif player_score == 21
    return "Black Jack"
  else
    return "You beat the bank! You win."
  end
end

def play_game
  # TODO: make the user play from terminal in a while loop that will stop
  #       when the user will not be asking for  a new card
end
