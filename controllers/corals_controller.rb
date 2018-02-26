require_relative('../models/coral.rb')



get '/coral' do
  @corals = Coral.all()
  erb :"coral/index"
end
