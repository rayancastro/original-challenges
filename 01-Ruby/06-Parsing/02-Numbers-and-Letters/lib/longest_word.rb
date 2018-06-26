require 'open-uri'
require 'json'
require 'net/http'

ALPHABET = ("A".."Z").to_a

def generate_grid(grid_size)
  # TODO: generate random grid of letters
  grid = []
  grid_size.times do
    grid.push(ALPHABET[rand(0..ALPHABET.size - 1)])
  end
  return grid
end

def check_grid(word, grid)
  word.upcase!.each_char do |char|
    grid.include?(char) ? grid.delete_at(grid.index(char)) : (return false)
  end
  return true
end

def word_to_json(word)
  url = "https://wagon-dictionary.herokuapp.com/" + word
  uri = URI(url)
  response = Net::HTTP.get(uri)
  JSON.parse(response)
end

def run_game(attempt, grid, start_time, end_time)
  # Calculate the time
  time = end_time - start_time
  # Check if the word used the letters on the grid
  return { time: time, score: 0, message: "Word is not in the grid." } unless check_grid(attempt, grid)
  # Assemble the right URL for the JSON request, using the word
  my_hash = word_to_json(attempt)
  # From the JSON, check if it is a valid word
  if my_hash["found"]
    # Calculate the score from the word lenght and the time.
    score = my_hash["length"] / time
  else
    return { time: time, score: 0, message: "#{attempt} is not an english word." }
  end
  # Return a result hash, with the score, message, and time.
  return { time: time, score: score, message: "Well done!" }
end
