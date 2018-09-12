post '/question' do
  if session[:user_id]
    user = User.find_by(id: session[:user_id])
    question = Question.new(question: params[:user][:question],name: user[:name],email: user[:email], user_id: user[:id])    #include user and password
    question.save
    redirect back
    # question.user_id = session[:user_id]
    # let them post # QUESTIO N:
  else
    redirect 'form/login'
  end
end

post '/update_post' do

  if session[:user_id]
    user = User.find_by(id: session[:user_id])
    session[:user_id] = user.id
    # question =  Question.find_by(question: params[:question])
    # redirect "questions/#{question.id}"
    question = Question.find_by(user_id: session[:user_id])
    redirect "/questions/#{question.id}"
  else
    redirect back
  end
end

# get '/questions/:id' do
#   p params
#   # params = {id:10}
#   @user = User.find_by(id: params[:id])
#   @question = Question.find_by(question: params[:question])
#   # @question_to_update = Question.all.where(user_id: session[:user_id]).last
#   # @question = Question.find(email: params[:user][:email])
#   #Story 3 - Profile Page
#   if @user
#     erb :"user_page/question"
#   else
#     redirect '/404'
#   end
# end
#
# get '/404' do
#   return "Something went wrong :("
# end

get '/questions' do
  @questions = Question.all
  # redirect "/questions/#{question.id}"
  erb :"questions/index"
end


get '/questions/:id' do
  @list = Question.all.where(user_id: current_user.id)
  # @selected_question = @list.find_by(question: params[:question])
  erb :"user_page/question"
end

get 'user_page/question' do
  erb :"user_page/question"
end

post '/update_status/:id' do
  user = User.find_by(id: session[:user_id])
  session[:user_id] = user.id
  # question = Question.find_by(question: params[:question])
  question = Question.find(params[:id])
  question.update(question: params[:user][:update])
  redirect "/questions/#{question.id}"
  # redirect "/users/#{user.id}"
end


post '/delete_post/:id' do
  # if session[:user_id]
    user = User.find_by(id: session[:user_id])
    session[:user_id] = user.id
    question = Question.find(params[:id])
    question.destroy
    redirect "/questions/#{question.id}"
  # else
  #   redirect "/users/#{user.id}"
  # end
end
