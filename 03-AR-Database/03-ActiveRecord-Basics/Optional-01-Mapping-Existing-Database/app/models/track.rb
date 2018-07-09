class Track < ActiveRecord::Base
  belongs_to :album
  belongs_to :genre
  belongs_to :media_type
  has_one :artist, through: :album

  def seconds
    milliseconds / 1000
  end
end
