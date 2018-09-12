helpers do
  def current_user
    @current_user ||= User.find_by_id(session[:user_id])#this occur if @current-user is nil
  end

  def current_question

    @current_question ||= Question.all.where(user_id: session[:user_id]).last
    # questions = Question.where(user_id: session[:user_id])
    # while i <= question.length do
    #   @current_question ||= questions[x].question
    # end
    # # @current_question = Question.select("question").(user_id: session[:user_id])
    # p < @current_question.length - 1
    # @current_question.each do |p|
    #   puts @current_question[p]
    # end
  end

  #Return trues if current_user exists, false otherwise
  def logged_in?
    !current_user.nil?
  end

  def any_question?
    !current_question.nil?
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
