require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/sights')

get '/' do
  erb( :index )
end
