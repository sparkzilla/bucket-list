require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('../db/seeds')
require_relative( '../models/users' )
also_reload( '../models/*' )

get '/users' do
  @users = User.all()
  erb ( :"users/index" )
end
