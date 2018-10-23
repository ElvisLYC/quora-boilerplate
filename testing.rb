furniture = [
  {"name" => "bed", "color" => "black", "size" => "12", "date_created" => "12/6", "condition" => "New"},
  {"name" => "chair", "color" => "brown", "size" => "7", "date_created" => "6/13", "condition" => "Used"},
  {"name" => "desk", "color" => "maple", "size" => "9", "date_created" => "2/13", "condition" => "New"}
]


p furniture.map {|x| x.values[1]}

# question = Question.all
# @question = question.map{|x| param[:x.values][1]}


p 123.to_s


<h2>All Questions</h2>

<% @all_question.each_with_index do |question, index| %>
<a href="/questions/<%= question.id %> "><%= "#{index+1}.#{question.question} [ -#{question.name}]"%> <br></a><br>
<% end %>


<h2>All Answers</h2>

<% @all_answer.each_with_index do |answer, index| %>
<a href="/questions/<%= answer.question_id %>/answers/<%=answer.id%>"><%= "#{index+1}.#{answer.answer} [ -#{answer.id}]"%> <br></a><br>
<% end %>


<form method="post" action="/vote_answer/">
  <input type=submit value= "Vote Answer">
</form>


post '/questions/:id/answers/:answer_id' do
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


<form action="/questions/<%= @answer.question_id %>/answers/<%=@answer.id%>" method="post">
<input type=submit value= "Vote Answer" name= "user[user_vote]">
<!-- vote features should be right next to this link -->
  <!--Working on votes at question page -->
  <!-- How to make vote_answer capture each answer's id -->
  <br>
</form>


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
end
