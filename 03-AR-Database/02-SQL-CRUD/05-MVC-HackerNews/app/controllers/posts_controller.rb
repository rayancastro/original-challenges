require_relative '../models/post.rb'

class PostsController
  def initialize
    @view = PostsView.new
  end

  ################################################################
  # BEWARE: you MUST NOT use the global variable DB in this file #
  ################################################################

  def index
    # TODO: implement listing all posts
    @view.display_all(Post.all)
  end

  def create
    # TODO: implement creating a new post
    title = @view.ask_title
    post = Post.new(title: title)
    post.save
  end

  def update
    id = @view.ask_post_id_update
    post = Post.find(id)
    title = @view.ask_title_update(post)
    url = @view.ask_url_update(post)
    post.title = title unless title == ""
    post.url = url unless url == ""
    post.save
    # votes = @view.ask_votes_update(post)
  end

  # def generate_attributes(title, votes, url, id)
  #   result = {}
  #   result[:title] = title unless title == ""
  #   result[:votes] = votes unless votes == 0
  #   result[:url] = url unless url == ""
  #   result[:id] = id if id
  #   result
  # end

  def destroy
    id = @view.ask_post_id_delete
    post = Post.find(id)
    check = @view.ask_confirmation(post)
    post.destroy if check
  end

  def upvote
    # TODO: implement upvoting a post
    id = @view.ask_post_id_upvote
    post = Post.find(id)
    post.votes += 1
    post.save
  end
end
