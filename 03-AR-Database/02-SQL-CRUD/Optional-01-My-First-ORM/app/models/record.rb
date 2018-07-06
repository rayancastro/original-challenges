# You can use a global variable, DB, which
# is an instance of SQLite3::Database
# NO NEED TO CREATE IT, JUST USE IT.
require 'pry-byebug'
class Record
  # TODO: all the code should be here!

  def initialize(attributes = {})
    @table_name = self.class.to_s.downcase + "s"
    @column_headers = []
    attributes.each do |key, value|
      var_name = "@" + key.to_s
      @column_headers.push(key.to_s)
      instance_variable_set(var_name, value)
    end
  end

  def method_missing(method, value = nil)
    super if method.nil?
    if method.to_s[-1] == "="
      fail StandardError, "Not allowed to change id" if method.to_s[0..1] == "id"
      assign = "@" + method.to_s[0..-2]
      instance_variable_set(assign, value)
    else
      getter = "@" + method.to_s
      return instance_variable_get(getter)
    end
  end

  def self.all
    table_name = self.name.to_s.downcase + "s"
    result = []
    query = "SELECT * FROM #{table_name}"
    DB.results_as_hash = true
    DB.execute(query).each do |record|
      params = {}
      record.each do |key, value|
        params[key.to_sym] = value if key.class == String
      end
      result << self.new(params)
    end
    return result
  end

  def self.find(id)
    table_name = self.name.to_s.downcase + "s"
    query = "SELECT * FROM #{table_name} WHERE id = ?"
    DB.results_as_hash = true
    record = DB.execute(query, id).first
    params = {}
    if record
      record.each do |key, value|
        params[key.to_sym] = value if key.class == String
      end
      self.new(params)
    else
      return nil
    end
  end

  def destroy
    query = "DELETE FROM #{@table_name} WHERE id = ?"
    DB.execute(query, @id)
  end

  def save
    @id.nil? ? insert : update
  end

  def insert
    first_column = @column_headers.first
    query = "INSERT INTO #{@table_name} (#{first_column}) VALUES (?)"
    getter = "@" + first_column
    DB.execute(query, instance_variable_get(getter))
    @id = DB.last_insert_row_id
    @column_headers[1..-1].each do |column|
      query = "UPDATE #{@table_name} SET " + column + "=? WHERE id=?"
      getter = "@" + column
      DB.execute(query, instance_variable_get(getter), @id)
    end
  end

  def update
    @column_headers.each do |column|
      query = "UPDATE #{@table_name} SET " + column + "=? WHERE id=?"
      getter = "@" + column
      DB.execute(query, instance_variable_get(getter), @id)
    end
  end
end
