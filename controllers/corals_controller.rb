require_relative('../models/coral.rb')



get '/coral' do
  @corals = Coral.all()
  erb :"coral/index"
end

get '/coral/new' do
  @corals = Coral.all
  @reefs = Reef.all
  erb :"coral/new"
end

post '/coral/new' do
  @corals = Coral.new( params )
  @corals.save()
  redirect to '/coral'
end
