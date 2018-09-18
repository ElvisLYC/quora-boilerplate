helpers do
  def current_user
    @current_user ||= User.find_by_id(session[:user_id])#this occur if @current-user is nil
  end

  def current_question
    @current_question ||= Question.all.where(user_id: session[:user_id]).last
  end

  def current_answer
    @current_answer ||= Answer.find_by_user_id(session[:user_id])#this occur if @current-user is nil
  end

  #Return trues if current_user exists, false otherwise
  def logged_in?
    !current_user.nil?
  end

  def any_question?
    !current_question.nil?
  end

  def any_answer?
    !current_answer.nil?
  end
  #a convenient method to set the session to given user;s # id
  def sign_in(user)
     session[:user_id] = user.id
  end

  #clears the session by setting the value of ':user_id'

  def sign_out
    session[:user_id] = nil
  end

end
