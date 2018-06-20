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
  player_score = 0
  bank_score = pick_bank_score
  loop do
    puts "Card? 'y' or 'yes' to get a new card"
    input = gets.chomp
    if input == ('y' || 'yes')
      player_score += pick_player_card
      puts state_of_the_game(player_score, bank_score)
      if player_score >= 21
        puts end_game_message(player_score, bank_score)
        break
      end
    else
      puts end_game_message(player_score, bank_score)
      break
    end
  end
end
