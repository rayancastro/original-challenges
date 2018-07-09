class Track < ActiveRecord::Base
  self.table_name = "TRACK"
  self.primary_key = "id"
  belongs_to :album
  belongs_to :genre
  belongs_to :media_type
  has_one :artist, through: :album

  def seconds
    milliseconds / 1000
  end
end
