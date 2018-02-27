require('pry')
require_relative('../models/reef.rb')


get '/reef' do
  @reefs = Reef.all()
  erb :"reef/index"
end

get '/reef/new' do
  @corals = Coral.all
  @reefs = Reef.all
  erb :"reef/new"
end

get '/reef/:id' do
  @reef = Reef.find_by_id(params[:id])
  @corals = @reef.corals()
  erb :"reef/show"
end


#----------------


post '/reef/new' do
  @corals = Coral.new( params )
  @corals.save()
  redirect to '/'
end
