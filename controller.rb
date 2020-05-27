require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('./models/student')
also_reload('./models/*')


get '/students' do
  @students = Student.all()
  erb(:index)
end

get '/students/new' do
  erb (:new)
end

# get '/students/:id/edit' do
#   id = params[:id]
#   @order = Student.find(id)
#   erb(:edit)
# end
#

#
# get '/students/:id' do
#   id = params[:id]
#   @order = Student.find(id)
#   erb(:show)
# end
#
#
#
post '/students' do
  @order= Student.new(params)
  @order.save()
  erb(:create)
end
#
# post '/students/:id/delete' do
#   id = params[:id]
#   @order = Student.find(id)
#   @order.delete()
#
#   redirect to ('/student')
# end
#
# post '/students/:id' do
#   id = params[:id]
#   @order = Student.new(params)
#
#   @order.update()
#
#   redirect to ('/student')
# end
