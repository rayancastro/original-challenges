# You can use a global variable, DB, which
# is an instance of SQLite3::Database
# NO NEED TO CREATE IT, JUST USE IT.

class Post
  attr_accessor :title, :url, :votes
  attr_reader :id
  def initialize(attributes = {})
    @id = attributes[:id]
    @title = attributes[:title]
    @url = attributes[:url]
    @votes = attributes[:votes]
  end

  def self.all
    result = []
    query = "SELECT * FROM posts"
    DB.results_as_hash = true
    DB.execute(query).each do |post|
      result << Post.new(id: post['id'], title: post['title'], url: post['url'], votes: post['votes'])
    end
    return result
  end

  def self.find(id)
    query = "SELECT id, title, url, votes FROM posts WHERE id = ?"
    DB.results_as_hash = true
    post = DB.execute(query, id).first
    Post.new(id: post['id'], title: post['title'], url: post['url'], votes: post['votes']) if post
  end
end
