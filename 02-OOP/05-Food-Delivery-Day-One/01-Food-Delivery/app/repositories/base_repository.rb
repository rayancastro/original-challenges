require 'csv'
CSV_OPTIONS = {headers: true, header_converters: :symbol}

class BaseRepository
  attr_accessor :elements, :next_id, :csv_filepath
  def initialize(csv_filepath)
    @csv_filepath = csv_filepath
    @elements = []
    @next_id = 1
    load_csv
  end

  def increment_id
    @next_id += 1
  end

  def all
    @elements
  end

  def add(element)
    element.id = next_id
    elements.push(element)
    increment_id
    update_csv
  end

  def find(id)
    @elements.find { |element| element.id == id }
  end

  private

  def load_csv
    if File.exist?(csv_filepath)
      CSV.foreach(csv_filepath, CSV_OPTIONS) do |row|
        @elements << create_object(row)
      end
      @next_id = @elements[-1].id + 1
    end
  end
  def update_csv
    fail StandardError, "Please create this method in the subclass"
  end

  def create_object(row)
    fail StandardError, "Please create this method in the subclass"
  end

  # def csv_write
  #   fail StandardError, "Please create this method in the subclass"
  # end
end
