require 'active_record'
require 'sqlite3'
require 'yaml'
require_relative './models/album.rb'
require_relative './models/artist.rb'
require_relative './models/genre.rb'
require_relative './models/media_type.rb'
require_relative './models/track.rb'
require 'pry-byebug'

def reversed_sorted_artists
  # TODO: return an ActiveRecord::Relation (array) of Artist, in reversed alphabetical order
  Artist.order(name: :desc)
end

def love_tracks
  # TODO: return an ActiveRecord::Relation (array) of Track which sings about Love
  Track.where("name LIKE ?", "%love%")
end

def long_tracks(min_length)
  # TODO: return an ActiveRecord::Relation (array) of Track of at least `min_length` minutes
  Track.where("milliseconds >= ?", min_length * 60_000)
end

def top_five_artists(genre_name)
  Artist.select('artists.name, COUNT(tracks.name) as c')
        .joins(albums: { tracks: :genre })
        .where(genres: { name: genre_name })
        .group('artists.name')
        .order('c DESC')
        .limit(5)
end
