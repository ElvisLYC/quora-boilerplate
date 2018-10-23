# for voting at answer page
post '/questions/:id/answers/:answer_id/vote' do
vote_by_user = Vote.where(answer_id: params[:answer_id], user_id: current_user.id)
  if session[:user_id] && vote_by_user.empty? == true
    # question = Question.find_by(question: params[:question])
    vote = Vote.new(vote: params[:user][:votes], vote: 1, user_id: current_user.id, answer_id: params[:answer_id], question_id: params[:id])
    vote.save
    redirect back

  else
    redirect back
  end
end

post '/vote_answer/:id' do
  answer = Answer.find(params[:id])
  question = Question.find(answer.question_id)
  vote = Vote.new(vote: params[:user][:votes], user_id: current_user.id, question_id: question.id)
  vote.answer_id = Answer.find_by(id: params[:id]).id
  vote_by_user = Vote.where(answer_id: vote.answer_id, user_id: current_user.id)
  if vote_by_user.empty? == true
    vote.save
    redirect back
  else
    redirect back
  end
  redirect back
end

post '/remove_votes/:id' do
  puts params

  vote = Vote.where(user_id: current_user.id, answer_id: params[:id])
  if vote.empty? == false
    vote.destroy_all
    redirect back
  else
    redirect back
  end
end

# testing ajax and jquery
# post '/votes' do
#   # create a new Votes
#   {object: "Success!"}.to_json
#
# end
