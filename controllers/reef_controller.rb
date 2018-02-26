
require_relative('../models/reef.rb')



get '/reef' do
  @reefs = Reef.all()
  erb :"reef/index"
end
