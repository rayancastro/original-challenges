class Post < ActiveRecord::Base
  belongs_to :user
  validates :name, uniqueness: true, presence: true

  # TODO: Copy-paste your code from previous exercise
end
