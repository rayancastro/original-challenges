require "sinatra"
require "sinatra/reloader" if development?
require "pry-byebug"
require "better_errors"
require_relative "config/application"
configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = File.expand_path(__dir__)
end

set :views, (proc { File.join(root, "app/views") })
set :bind, '0.0.0.0'

def parse
  url = "https://hacker-news.firebaseio.com/v0/"
  response = RestClient.get(url + "topstories.json")
  JSON.parse(response)
end

def latest_hacker_posts(num)
  top_stories = parse
  top_stories[0..num - 1].each do |id|
    item_response = RestClient.get(url + "item/" + id.to_s + ".json")
    item = JSON.parse(item_response)
    post = Post.all.where('name = ?', item["title"]).first if Post.all.where('name = ?', item["title"]).first
    post ? post.votes = item["score"] : post = Post.new(name: item["title"], url: item["url"], votes: item["score"])
    post.save
  end
end



get '/' do
  latest_hacker_posts(10)
  @posts = Post.all
  erb :posts # Do not remove this line
end

# TODO: add more routes to your app!
