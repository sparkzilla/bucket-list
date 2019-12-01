require( 'sinatra' )
require( 'sinatra/contrib/all')
require_relative('../db/seeds')
require_relative('../models/countries')
also_reload('../models/*')

get '/countries' do
  @countries= Country.all()
  erb (:"countries/index")
end

get '/countries/new' do
  @countries = Country.all
  erb (:"/countries/new")
end

get '/countries/:id' do
  @country = Country.find_by_id(params['id'].to_i)
  erb(:"countries/show")
end

post '/countries/:id/delete' do
  Country.delete_by_id(params['id'].to_i)
  redirect to ("/countries")
end
