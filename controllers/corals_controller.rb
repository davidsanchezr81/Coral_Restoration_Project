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
  redirect to '/'
end


#------------------------ not working the update
get '/coral/:id' do
  @coral = Coral.find( params['id'] )
  erb :"coral/edit"
end

# #get '/coral/:id/edit' do
#   @coral = Coral.find( params['id'] )
#   erb :"coral/edit"
# end

post '/coral/:id' do # updating corals information
  Coral.new( params ).update
  redirect to '/coral'
end

#-
post '/coral/:id/delete' do # delete
  coral = Coral.find( params[:id] )
  coral.delete()
  redirect to '/coral'
end
## COMO MANDAR UN MENSAJE DESPUES DE REMOVER EL CORAL?????(remove.erb)
