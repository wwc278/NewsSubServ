module SessionsHelper

  def login!(user)
    user.token = SecureRandom.urlsafe_base64
    user.save!
    session[:token] = user.token
    @current_user = user
  end

  def logged_in?
    
    !!current_user
  end

  def current_user
    return nil unless session[:token]
    @current_user ||= User.find_by_token(session[:token])
  end

  def logout
    current_user.token = nil
    session[:token] = nil
  end
end
