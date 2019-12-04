require( 'sinatra' )
require( 'sinatra/contrib/all')
require_relative('../db/seeds')
require_relative('../models/countries')
also_reload('../models/*')

get '/countries' do
  @countries= Country.all()
  @url = ""
  @map_url = "https://www.mapquestapi.com/staticmap/v5/map?key=wGML8wgmXkCrOW0ymESQKWNbOUCNQI2D&&size=1390,375&type=light&locations="
  erb (:"countries/index")
end

get '/countries/new' do
  @countries = Country.all
  erb (:"/countries/new")
end

get '/countries/:id' do
  @country = Country.find_by_id(params['id'].to_i)
  @url = ""
  @map_url = "https://www.mapquestapi.com/staticmap/v5/map?key=wGML8wgmXkCrOW0ymESQKWNbOUCNQI2D&&size=1390,375&type=light&locations="
  erb(:"countries/show")
end

post '/countries/:id/delete' do
  Country.delete_by_id(params['id'].to_i)
  redirect to ("/countries")
end
