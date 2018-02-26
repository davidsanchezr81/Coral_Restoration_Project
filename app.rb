require('sinatra')
require('sinatra/contrib/all')

require_relative('./controllers/reef_controller.rb')
require_relative('./controllers/corals_controller.rb')


get '/' do
erb(:index)
end
