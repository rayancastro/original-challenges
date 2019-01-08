require 'sqlite3'

def detailed_tracks(db)
  # TODO: return the list of tracks with their album and artist.
  query = <<-SQL
    SELECT tracks.name, albums.title, artists.name
    FROM tracks
    JOIN albums ON tracks.album_id = albums.id
    JOIN artists ON albums.artist_id = artists.id
  SQL
  db.execute(query)
end

def stats_on(db, genre_name)
  # TODO: For the given category of music, return the number of tracks and the average song length (as a stats hash)
  query = <<-SQL
    SELECT COUNT(*), AVG(milliseconds)
    FROM tracks
    JOIN genreS ON tracks.genre_id = genres.id
    WHERE genres.name = "#{genre_name}"
  SQL
  data = db.execute(query)[0]
  result = { category: genre_name, number_of_songs: data[0], avg_length: format("%.2f", data[1] / 60_000).to_f }
end

def top_five_artists(db, genre_name)
  # TODO: return list of top 5 artists with the most songs for a given genre.
  query = <<-SQL
    SELECT artists.name, COUNT(*) as wagon
    FROM tracks
    JOIN genres ON tracks.genre_id = genres.id
    JOIN albums ON tracks.album_id = albums.id
    JOIN artists ON albums.artist_id = artists.id
    WHERE genres.name = "#{genre_name}"
    GROUP BY artists.name
    ORDER BY wagon DESC
    LIMIT 5
  SQL
  data = db.execute(query)
end
