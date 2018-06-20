def beer_song(beer_start_count)
  if beer_start_count == 2
    puts "#{beer_start_count} bottles of beer on the wall, #{beer_start_count} bottles of beer!"
    puts "Take one down, pass it around, #{beer_start_count - 1} bottle of beer on the wall!"
    beer_song(beer_start_count - 1)
  elsif beer_start_count <= 1
    puts "#{beer_start_count} bottle of beer on the wall, #{beer_start_count} bottle of beer!"
    puts "Take one down, pass it around, no more bottles of beer on the wall!"
  else
    puts "#{beer_start_count} bottles of beer on the wall, #{beer_start_count} bottles of beer!"
    puts "Take one down, pass it around, #{beer_start_count - 1} bottles of beer on the wall!"
    beer_song(beer_start_count - 1)
  end
end

beer_song(ARGV[0].to_i)
