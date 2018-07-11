require "json"
require "rest-client"
require "pry-byebug"
require "faker"

user = User.new(username: Faker::Internet.user_name, email: Faker::Internet.email)
user.save

def latest_hacker_posts(num, user)
  url = "https://hacker-news.firebaseio.com/v0/"
  response = RestClient.get(url + "topstories.json")
  top_stories = JSON.parse(response)
  top_stories[0..num - 1].each do |id|
    item_response = RestClient.get(url + "item/" + id.to_s + ".json")
    item = JSON.parse(item_response)
    post = Post.new(name: item["title"], url: item["url"], votes: item["score"])
    post.user = user
    post.save
  end
end

latest_hacker_posts(10, user)
