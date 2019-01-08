class Post
  attr_reader :id
  attr_accessor :title, :url, :votes

  def initialize(attributes = {})
    @id = attributes[:id]
    @url = attributes[:url]
    @votes = attributes[:votes] || 0
    @title = attributes[:title]
  end

  def save
    @id.nil? ? insert : update
  end

  def insert
    query = "INSERT INTO posts (url, votes, title) VALUES (?, ?, ?)"
    DB.execute(query, @url, @votes, @title)
    @id = DB.last_insert_row_id
  end

  def update
    query = "UPDATE posts SET url=?, votes=?, title=? WHERE id=?"
    DB.execute(query, @url, @votes, @title, @id)
  end

  # TODO
end
