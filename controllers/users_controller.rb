get '/' do
  @list = Question.all.where(user_id: current_user.id)
  @all_question = Question.all
  erb :"home"

end

get '/form/signup' do
#do something
  erb :"form/signup"
end

post '/signup' do
  p params
  user = User.new(name: params[:user][:name], email: params[:user][:email], password: params[:user][:password])    #include user and password
  user.save                      # save user
  #redirect user to login page
  redirect '/'
    # what should happen if the user keyed in invalid date?
end

get '/user_page/user_profile' do
#do something
  # user_email = User.find_by(email: params[:user][:email])
  @name = User.find_by(email: params[:user][:email])
  erb :"user_page/user_profile"
end

get '/form/login' do
#do something
  erb :"form/login"
end


post '/login' do
  p params
  user = User.find_by(email: params[:user][:email])
  if user && user.authenticate(params[:user][:password])
    session[:user_id] = user.id #check
    redirect "/users/#{user.id}" #check
  else
    redirect back
  end
end

post '/logout' do
  p params
  session[:user_id] = nil
  redirect 'form/login'
  # kill a session when a user chooses to logout, for example, assign nil to a session
  # redirect to the appropriate page
end

get '/users/:id' do
  p params
  # params = {id:10}
  @user = User.find_by(id: params[:id])
  @question = Question.find_by(user_id: params[:id])
  @list = Question.all.where(user_id: params[:id])
  # @question_to_update = Question.all.where(user_id: session[:user_id]).last
  # @question = Question.find(email: params[:user][:email])
  #Story 3 - Profile Page
  if @user
    erb :"user_page/user_profile"
  else
    redirect '/404'
  end
end

get '/404' do
  return "Something went wrong :("
end
