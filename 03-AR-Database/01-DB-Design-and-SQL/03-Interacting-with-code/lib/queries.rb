require 'sqlite3'

def artist_count(db)
  # TODO: use `db` to execute an SQL query against the database.
  db.execute("SELECT COUNT (*) FROM artists")[0][0]
end

def number_of_rows(db, table_name)
  # TODO: count number of rows in table table_name
  db.execute("SELECT COUNT (*) FROM #{table_name}")[0][0]
end

def sorted_artists(db)
  # TODO: return array of artists' names sorted alphabetically
  db.execute("SELECT name FROM artists ORDER BY name ASC").map { |array| array[0] }
end

def love_tracks(db)
  # TODO: return array of love songs' names sorted alphabetically
  db.execute("SELECT name FROM tracks WHERE name like '%love%' ORDER BY name ASC").map { |array| array[0] }
end

def long_tracks(db, min_length)
  min_length *= 60_000
  result = db.execute("SELECT name FROM tracks WHERE milliseconds > #{min_length} ORDER BY milliseconds ASC")
  # TODO: return an array of tracks' names verifying: duration > min_length (minutes) sorted by length (ascending)
  result.map { |array| array[0] }
end
