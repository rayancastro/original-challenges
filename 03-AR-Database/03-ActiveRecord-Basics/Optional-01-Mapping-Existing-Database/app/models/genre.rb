class Genre < ActiveRecord::Base
  has_many :tracks
  # has_many :albums, through: :tracks

  def albums
    tracks.map { |track| track.album }.uniq
  end

  def artists
    albums.map { |album| album.artist }.uniq
  end
end


