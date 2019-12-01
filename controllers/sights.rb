require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('../db/seeds')
require_relative( '../models/sights' )
require_relative( '../models/cities' )
also_reload( '../models/*' )

get '/sights' do
  @sights = Sight.all()
  erb (:"sights/index")
end

get '/sights/new' do
  @sights = Sight.all
  erb (:"/sights/new")
end

get '/sights/:id' do
  @sight = Sight.find_by_id(params['id'].to_i)
  erb(:"sights/show")
end

get '/sights/status/:status' do
  @sights = Sight.find_by_status(params['status'])
  erb ( :"sights/index" )
end

post '/sights' do
  sight = Sight.new(params)
  sight.save
  redirect to("/sights")
end

post '/sights/:id/delete' do
  Sight.delete_by_id(params['id'].to_i)
  redirect to ("/sights")
end
