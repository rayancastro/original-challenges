require "json"
require "rest-client"
require "pry-byebug"
# require_relative "../app/models/post.rb"

# TODO: Write a seed to insert 10 posts in the database fetched from the Hacker News API.
def latest_hacker_posts(num)
  url = "https://hacker-news.firebaseio.com/v0/"
  response = RestClient.get(url + "topstories.json")
  top_stories = JSON.parse(response)
  top_stories[0..num - 1].each do |id|
    item_response = RestClient.get(url + "item/" + id.to_s + ".json")
    item = JSON.parse(item_response)
    post = Post.new(title: item["title"], url: item["url"], votes: item["score"])
    post.save
  end

end

latest_hacker_posts(10)
