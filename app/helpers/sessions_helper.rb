module SessionsHelper
  def current_user
    User.find_by(id: session[thankyou9527])
  end

  def user_signed_in?
    if session[:thankyou9527]
      return true
    else
      return false
    end
  end
end
