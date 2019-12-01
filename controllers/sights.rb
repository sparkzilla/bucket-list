require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('../db/seeds')
require_relative( '../models/sights' )
require_relative( '../models/cities' )
also_reload( '../models/*' )

get '/sights' do
  @sights = Sight.all
  erb (:"sights/index")
end

get '/sights/new' do
  @sights = Sight.all
  @cities = City.all
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
  #get the city param
  #save city
  #use city.id in Sight params
  #extract the other params (name, status) OR remove city
  #create a new hash with name, status, city_id
  #save sight

  city_param = params['city']


  #if city exixists, return city id
    city_id = City.find_by_name_return_id(city_param)
    if (city_id == false)
      new_city = {"name" => "#{city_param}"}
      city = City.new(new_city)
      city.save
      city_id = city.id.to_s
    end

  status_param = params[:status]
  sight_name_param = params[:name]

  new_sight = {
    "name" => "#{sight_name_param}",
    "status" => "#{status_param}",
    "city_id" => city_id
  }

  p new_sight.to_s

  sight = Sight.new(new_sight)
  sight.save
  redirect to("/sights")
end

post '/sights/:id/delete' do
  Sight.delete_by_id(params['id'].to_i)
  redirect to ("/sights")
end
