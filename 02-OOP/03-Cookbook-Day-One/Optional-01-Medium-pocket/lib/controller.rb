require_relative 'view.rb'
require_relative 'repository.rb'
require "open-uri"
require "nokogiri"

class Controller
  def initialize(repository)
    @repository = repository
    @view = View.new
  end

  def list
    @view.display_all(@repository.all)
  end

  def goodbye
    @view.goodbye
  end

  def save
    path = @view.ask_user_for_path
    post = scrape_post_from_path(path)
    @repository.add_post(post)
  end

  def read
    list
    index = @view.ask_user_for_index
    post = @repository.all[index]
    @view.display_post(post)
    post.mark_as_read!
  end

  def mark
    list
    index = @view.ask_user_for_index
    post = @repository.all[index]
    post.mark_as_read!
  end

  def scrape_post_from_path(path)
    url = "https://medium.com/" + path
    html_file = open(url).read
    html_doc = Nokogiri::HTML(html_file)

    str = html_doc.search('.section-inner').to_s.split('</h3>').join('/n')
    text = Nokogiri::HTML(str).text.gsub('/n', "")
    title = html_doc.search('h1').text
    text = text.split(title)[1].to_s
    author = html_doc.search('h3 a').first.text
    post = Post.new(path, title, text, author)
    return post
  end

end

# con = Controller.new("banana")
# path = "le-wagon/can-anyone-learn-to-code-b1d84a0bd6a"
# post = con.scrape_post_from_path(path)
# File.write("teste.txt", con.scrape_post_from_path(path))
# p post.title
# p post.author
# p post.path
# p post.read
# puts post.text
