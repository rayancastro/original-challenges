require_relative "../views/posts_view"

class PostsController
  def initialize
    @view = PostsView.new
  end

  def index
    # DO NOT WRITE SQL QUERIES
    # TODO: gather all posts from the database
    # TODO: give them to the view to be printed
    @view.display_all(Post.all)
  end

  def create
    # DO NOT WRITE SQL QUERIES
    # TODO: create a post
    title = @view.ask_title
    post = Post.new(title: title)
    post.save
  end

  def update
    # DO NOT WRITE SQL QUERIES
    # TODO: update a post
    id = @view.ask_post_id_update
    post = Post.find(id)
    title = @view.ask_title_update(post)
    url = @view.ask_url_update(post)
    post.title = title unless title == ""
    post.url = url unless url == ""
    post.save
  end

  def destroy
    # DO NOT WRITE SQL QUERIES
    # TODO: destroy a post
    id = @view.ask_post_id_delete
    post = Post.find(id)
    check = @view.ask_confirmation(post)
    post.destroy if check
  end

  def upvote
    # DO NOT WRITE SQL QUERIES
    # TODO: increment the `votes` column for a post
    id = @view.ask_post_id_upvote
    post = Post.find(id)
    post.votes += 1
    post.save
  end
end
