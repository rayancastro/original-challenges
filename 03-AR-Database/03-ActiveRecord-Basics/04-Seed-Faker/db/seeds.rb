require "faker"
# TODO: Write a seed to insert 100 posts in the database
N = 100
puts "Loading unexistant inventory..."
puts "Generating #{N} fake ids...."

N.times do
  post = Post.new(title: Faker::GameOfThrones.quote,
                  url:   Faker::Internet.url,
                  votes: rand(0..N))
  post.save
end
puts "Finished!"


