class Album < ActiveRecord::Base
  self.table_name = "THE_ALBUMS"
  self.primary_key = "id"
  has_many :tracks
  belongs_to :artist, class_name: "Artist", foreign_key: "id_artist"
  validates_presence_of :title, :artist
end

# Update kitt
