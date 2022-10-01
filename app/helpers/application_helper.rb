module ApplicationHelper

  def current_user_helper
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in_helper?
    !!current_user_helper
  end

  def required_user_helper
    if !logged_in_helper?
      flash[:error] = "You must be  logged"
      redirect_to login_path
    end
  end

end
