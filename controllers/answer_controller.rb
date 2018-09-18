get '/answer/answer_page' do
  @question = Question.all

#do something
  erb :"/answer/answer_page"
end

post '/questions/:id/answers' do
  if session[:user_id]
    question = Question.find(params[:id])
    answer = Answer.new(answer: params[:answer][:answer],question_id: question.id,user_id: current_user.id)    #include user and password
    answer.save
    redirect "/questions/#{question.id}"
    # question.user_id = session[:user_id]
    # let them post # QUESTIO N:
  else
    redirect 'form/login'
  end
end

get '/questions/:id/answers/:answer_id' do
  @answer = Answer.find(params[:answer_id])
  @question= Question.find(params[:id])
  erb :'/answer/answer_page'
end

post "/delete_answer/:answer_id" do
  # if session[:user_id]
    answer = Answer.find(params[:answer_id])
    if current_user.id == answer.user_id
    answer.destroy
    redirect '/'
    else
    redirect back
    end
end



post '/update_answer/:answer_id' do
  answer = Answer.find(params[:answer_id])
if current_user.id == answer.user_id
  # question = Question.find_by(question: params[:question])
  answer.update(answer: params[:user][:answer_update])
  redirect "/"
  # redirect "/users/#{user.id}"
else
  redirect back
end

end
