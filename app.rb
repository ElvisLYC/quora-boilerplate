require_relative './config/init.rb'


get '/' do
  erb :"home"
end


get '/form/signup' do
#do something
  erb :"form/signup"
end

get '/form/login' do
#do something
  erb :"form/login"
end


get '/user_page/user_profile' do
#do something
  # user_email = User.find_by(email: params[:user][:email])
  # @name = User.find_by(email: params[:user][:email])
  erb :"user_page/user_profile"
end


post '/signup' do
  user = User.new(params[:user])    #include user and password
  if user.save                      # save user
    #redirect user to login page
    redirect '/form/login'
  else
    # what should happen if the user keyed in invalid date?
    puts "invalid input"
  end
end

post '/login' do
  # apply a authentication method to check if a user has entered a valid email and password
  # if a user has successfully been authenticated, you can assign the current user id to a session
  user_input = User.find_by(email: params[:user][:email])
  # byebug
  if user_input && user_input.password == params[:user][:password]
    session[:user_id] = user_input.id
    redirect '/user_page/user_profile'
  else
    redirect '/'
  end
end

post 'question' do

  if session[:user_id]
    question.user_id = session[:user_id]
    # let them post # QUESTIO N:
  else
    #redirect Login
  end
end

post '/logout' do
  session[:user_id] = nil
  redirect 'form/login'
  # kill a session when a user chooses to logout, for example, assign nil to a session
  # redirect to the appropriate page
end
