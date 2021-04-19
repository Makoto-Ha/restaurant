class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.login(user_params)
    if user
      session[:thankyou9527] = user.id

      redirect_to root_path
    else
      redirect_to sign_in_sessions_path
    end
  end

  def destroy
    session[:thankyou9527] = nil

    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end