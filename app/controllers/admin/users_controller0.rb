class Admin::UsersController < ApplicationController
  before_action :check_admin
  before_action :set_user, only:[:show, :edit, :destroy, :update]

  def index
    @users = User.all.order('created_at DESC')
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'user are successfully create'
      redirect_to (admin_users_path)
    else
      flash[:notice] = 'oO something wrong'
      render :new
    end
  end
  def show
    @task =@user.tasks
  end
  def edit
  end
  def destroy
    if @user.destroy
      flash[:success] = 'user are successfully destroy'
      redirect_to (admin_users_path)
    else
      flash[:success] = 'oO something wrong'
      redirect_to admin_users_path
    end
  end
private
def check_admin
  if logged_in?
    redirect_to (root_path) unless current_user.admin?
  else
    redirect_to(new_session_path)
  end
end
def user_params
  params.require(:user).permit(:name, :email, :password, :admin, :password_confirmation)
end
def set_user
  @user = User.find(params[:id])
end
end
