helpers do
  def current_user
    @current_user ||= User.find_by_id(session[:user_id])#this occur if @current-user is nil
  end

  #Return trues if current_user exists, false otherwise
  def logged_in?
    !current_user.nil?
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
