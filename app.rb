if development?
  require 'sinatra/reloader'
end

connection = Mongo::Connection.new('127.0.0.1', 27017)
db = connection.db('todos', :pool_size=> 5, :timeout => 5)

get '/' do
  haml :index, :attr_wrapper => '"', :locals => {:title => 'Todos'}
end

get '/todo' do
  haml :todo, :attr_wrapper => '"',  :locals => {:title => 'Our Sinatra Todo app'}
end

get '/api/:thing' do
  db.collection(params[:thing]).find.to_a.map {|t| frombsonid(t)}.to_json
end

get '/api/:thing/:id' do
  frombsonid(db.collection(params[:thing]).findone(tobsonid(params[:id]))).to_json
end

post '/api/:thing' do 
  #logger.error(request.body.read.to_s)
  #logger.error(params[:thing])
  #request.body.rewind
  oid = db.collection(params[:thing]).insert(JSON.parse(request.body.read.to_s))
  "{\"id\": \"#{oid.to_s}\"}"
end

delete '/api/:thing/:id' do
  result = db.collection(params[:thing]).remove('id' => tobsonid(params[:id]))
  logger.error(result)
  result.to_s
end

put '/api/:thing/:id' do
  db.collection(params[:thing]).update({'id' => tobsonid(params[:id])}, {'$set' => JSON.parse(request.body.read.to_s).reject{|k,v| k == 'id'}})
end

def tobsonid(id)
  BSON::ObjectId.from_string(id)
end

def frombsonid(obj)
  obj.merge({'_id' => obj['_id'].to_s})
end
