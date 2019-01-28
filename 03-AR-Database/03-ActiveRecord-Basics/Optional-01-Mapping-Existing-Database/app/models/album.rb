class Album < ActiveRecord::Base
  has_many :tracks
  belongs_to :artist
  validates_presence_of :title, :artist
end

#
