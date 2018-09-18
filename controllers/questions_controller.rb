post '/question' do
  if session[:user_id]
    question = Question.new(question: params[:user][:question],user_id: current_user.id)    #include user and password
    question.save
    redirect back
    # question.user_id = session[:user_id]
    # let them post # QUESTIO N:
  else
    redirect 'form/login'
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
  @question = Question.find(params[:id])
  @user = User.all
  @all_answer = Answer.all
  @current_user = User.find_by_id(session[:user_id])
  @this_question = Question.find_by(id: params[:id])
  @question_answer = Answer.all.where(question_id: params[:id])

  erb :"user_page/question"
end



get '/user_page/question' do

  erb :'/user_page/user_profile'
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


post '/update_status/:id' do
  user = User.find_by(id: session[:user_id])
  session[:user_id] = user.id
  question = Question.find(params[:id])

if current_user.id == question.user_id
  # question = Question.find_by(question: params[:question])
  question.update(question: params[:user][:update])
  redirect "/"
  # redirect "/users/#{user.id}"
else
  redirect back
end

end


post '/delete_post/:id' do
  # if session[:user_id]
    user = User.find_by(id: session[:user_id])
    question = Question.find(params[:id])
    answer = Answer.where(question_id: params[:id])
    vote = Vote.where(question_id: params[:id])
    session[:user_id] = user.id
    if current_user.id == question.user_id
      question.destroy
      answer.destroy_all
      vote.destroy_all
      redirect '/'
    else
      redirect back
    end
end
