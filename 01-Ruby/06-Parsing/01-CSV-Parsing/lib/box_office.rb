require 'csv'

CSV_OPTIONS = { col_sep: ',', quote_char: '"' }


def earning_selector(number, max_year, file_path)
  earnings_array = []
  CSV.foreach(file_path, CSV_OPTIONS) do |row|
    if row[1].to_i < max_year
      earnings_array.push(row[2].to_i)
      earnings_array.sort! { |x, y| y <=> x }
    end
  end
  return earnings_array[number - 1]
end

def most_successful(number, max_year, file_path)
  movies = []
  min_earning = earning_selector(number, max_year, file_path)
  CSV.foreach(file_path, CSV_OPTIONS) do |row|
    if (row[1].to_i < max_year) && (row[2].to_i >= min_earning)
      movies.push(name: row[0], year: row[1].to_i, earnings: row[2].to_i)
    end
  end
  movies = movies.sort_by { |movie| movie[:earnings] }.reverse
  return movies
end

# p most_successful(3, 2100, "movies.csv")
# filepath = (File.join(File.dirname(__FILE__), file_path))
