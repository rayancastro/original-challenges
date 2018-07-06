require_relative 'models/post.rb'
require_relative 'models/record.rb'
require_relative 'models/user.rb'

params = { id: 2, name: "Rayan", address: "Rua cancer" }
user = User.new(params)
user2 = User.new(params)
