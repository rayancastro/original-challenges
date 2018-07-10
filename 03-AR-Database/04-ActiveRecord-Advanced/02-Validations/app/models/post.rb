class Post < ActiveRecord::Base
  belongs_to :user
  validates :user, presence: true
  validates :name, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 5 }
  validates :url, presence: true, format: { with: /.*www\..*\.com.*/, message: "is invalid" }
end

