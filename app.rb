require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/sights')
require_relative('controllers/cities')
require_relative('controllers/countries')

get '/' do
  redirect to ("/sights")
end

# 404 Error!
# not_found do
#   status 404
#   erb (:oops)
# end
