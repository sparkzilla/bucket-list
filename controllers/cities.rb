require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('../db/seeds')
require_relative( '../models/cities' )
require_relative( '../models/sights' )
also_reload( '../models/*' )

get '/cities' do
  @cities = City.all()
  @url = ""
  @map_url = "https://www.mapquestapi.com/staticmap/v5/map?key=wGML8wgmXkCrOW0ymESQKWNbOUCNQI2D&&size=1390,375&type=light&locations="
  erb (:"/cities/index")
end

get '/cities/new' do
  @cities = City.all
  erb (:"/cities/new")
end

get '/cities/:id' do
  @city = City.find_by_id(params['id'].to_i)
  @url = ""
  @map_url = "https://www.mapquestapi.com/staticmap/v5/map?key=wGML8wgmXkCrOW0ymESQKWNbOUCNQI2D&&size=1390,375&type=light&locations="
  erb(:"cities/show")
end

post '/cities/:id/delete' do
  City.delete_by_id(params['id'].to_i)
  redirect to ("/cities")
end
