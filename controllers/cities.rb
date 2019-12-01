require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('../db/seeds')
require_relative( '../models/cities' )
also_reload( '../models/*' )

get '/cities' do
  @cities = City.all()
  erb (:"cities/index")
end

get '/cities/new' do
  @cities = City.all
  erb (:"/cities/new")
end

get '/cities/:id' do
  @cities = City.find_by_id(params['id'].to_i)
  erb(:"cities/show")
end

# post '/cities' do
#   city = City.new(params)
#   sight.save
#   redirect to("/sights")
# end

post '/cities/:id/delete' do
  City.delete_by_id(params['id'].to_i)
  redirect to ("/cities")
end
