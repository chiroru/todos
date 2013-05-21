if development?
  require 'sinatra/reloader'
end

connection = Mongo::Connection.new('127.0.0.1', 27017)
db = connection.db('todos', :pool_size=> 5, :timeout => 5)

get '/' do
#  return 'Hello World!'
  haml :index
end

