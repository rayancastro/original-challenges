def horse_racing_format!(race_array)
  # TODO: modify the given array so that it is horse racing consistent. This method should return nil.
  race_array.collect!.with_index { |horse, index| (index + 1).to_s + "-" + horse }
  race_array.reverse!
  race_array.collect! { |horse| horse + "!" }
end

