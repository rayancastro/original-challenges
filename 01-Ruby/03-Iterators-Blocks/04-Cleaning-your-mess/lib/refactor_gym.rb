def hop_hop_hop(number_of_exercises)
  (1..number_of_exercises).each do |i|
    (1..i).each do
      print "hop! "
    end
    print 'One more time...' + "\n"
  end
end

hop_hop_hop(6)
