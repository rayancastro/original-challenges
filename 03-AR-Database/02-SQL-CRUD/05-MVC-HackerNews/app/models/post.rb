class Post
  attr_accessor :title, :url, :votes
  attr_reader :id
  def initialize(attributes = {})
    @id = attributes[:id]
    @title = attributes[:title]
    @url = attributes[:url]
    @votes = attributes[:votes] || 0
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

  def destroy
    query = "DELETE FROM posts WHERE id = ?"
    DB.execute(query, @id)
  end

  def save
    @id.nil? ? insert : update
  end

  def insert
    query = "INSERT INTO posts (title, url, votes) VALUES (?, ?, ?)"
    DB.execute(query, @title, @url, @votes)
    @id = DB.last_insert_row_id
  end

  def update
    query = "UPDATE posts SET title=?, url=?, votes=? WHERE id=?"
    DB.execute(query, @title, @url, @votes, @id)
  end
end
