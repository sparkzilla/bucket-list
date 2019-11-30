require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('../db/seeds')
require_relative( '../models/sights' )
also_reload( '../models/*' )


get '/sights/:status' do
  @sights = Sight.find_by_status(params['status'])
  erb ( :"sights/index" )
end


get '/sights' do
  @sights = Sight.all()
  erb ( :"sights/index" )
end
