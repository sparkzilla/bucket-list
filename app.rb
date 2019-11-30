require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/sights')

get '/' do
  erb( :index )
end

# 404 Error!
not_found do
  status 404
  erb (:oops)
end
