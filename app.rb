require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/user')

get '/' do
  erb( :index )
end
