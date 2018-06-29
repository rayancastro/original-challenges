CSV_OPTIONS = { encoding: 'ISO-8859-1', skip_blanks: true, headers: false, col_sep: ",", quote_char: '"' }
require_relative 'post.rb'
require 'csv'

class Repository
  def initialize(filepath)
    @posts = []
    CSV.foreach(filepath, CSV_OPTIONS) do |row|
      @posts.push(Post.new(row[0], row[1], row[2], row[3], row[4]))
    end
  end

  def all
    @posts
  end

  def add_post(post)
    @posts.push(post)
  end

end


# posts = Repository.new(File.join(__dir__, 'posts.csv'))
