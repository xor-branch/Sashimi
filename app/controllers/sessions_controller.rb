class SessionsController < ApplicationController
  before_action :session_check, only:[:new]
  def new
  end
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash.now[:success] = 'well done!'
      redirect_to admin_users_path
    else
      redirect_to new_session_path
      flash[:danger] = 'ooh ! something is wrong'
    end
  end
  def destroy
    session.delete(:user_id)
    flash[:success] = 'good bye'
    redirect_to new_session_path
  end


  def session_check
    redirect_to user_path(current_user.id), notice:('you are already logged') if logged_in?
  end
end
