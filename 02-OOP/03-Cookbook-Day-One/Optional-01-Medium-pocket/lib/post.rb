class Post
  attr_accessor :title, :author, :text, :path, :read
  def initialize(path, title, text, author, read = false)
    @path = path
    @title = title
    @text = text
    @author = author
    @read = read
  end

  def mark_as_read!
    @read = !@read
  end
end
