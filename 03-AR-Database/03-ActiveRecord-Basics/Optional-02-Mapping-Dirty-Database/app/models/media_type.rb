class MediaType < ActiveRecord::Base
  self.table_name = "MEDIATYPES"
  self.primary_key = "id"
  has_many :tracks
end
