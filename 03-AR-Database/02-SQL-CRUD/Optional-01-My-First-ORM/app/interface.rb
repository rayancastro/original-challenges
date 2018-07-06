require_relative 'models/post.rb'
require_relative 'models/record.rb'
require_relative 'models/user.rb'

params = {id: 02, name: "Rayan", address: "Rua cancer"}
user = User.new(params)
user2 = User.new(params)


p user2

p user.table_name
p user.column_headers


# Criar instancia da propria classe em um metodo de classe

# Obter as colunas de uma query
