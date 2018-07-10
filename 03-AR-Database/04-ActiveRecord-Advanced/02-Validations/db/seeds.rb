# TODO: Write a seed
# TODO: Write a seed
FAKENAMES = %w[Pedro Andre Danilo Rayan Luis Marcelo Riza Erika]
num_users = 5
num_posts = 8

puts "Generating users..."
num_users.times do
  user = User.new
  user.username = FAKENAMES.sample
  user.email = Faker::Internet.email(user.username)
  user.save
end
puts "Database now has #{User.count} users"
puts ""
puts "Generating posts..."
User.all.each do |user|
  num_posts.times do
    post = Post.new
    post.user = user
    post.name = Faker::HarryPotter.book
    post.url = Faker::Internet.url
    post.votes = rand(0..671)
    post.save
  end
end
puts "Database now has #{Post.count} posts"
puts ""
