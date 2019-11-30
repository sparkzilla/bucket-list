require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('../db/seeds')
require_relative( '../models/users' )
also_reload( '../models/*' )



get '/sights' do
  @users = User.all()
  erb ( :"sights/index" )
end



get '/sights' do
  @sights = Sight.all()
  erb ( :"sights/index" )
end
