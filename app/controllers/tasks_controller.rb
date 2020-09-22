class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :login_check, only: [:index,:show, :new, :edit, :destroy]
  before_action :user_check, only:[:show, :edit, :destroy]
  PER = 4
  def index
    if params[:sort_expired]
      @tasks=current_user.tasks.all.order(end_time: :desc).page(params[:page]).per(4)
    elsif params[:sort_priority]
      @tasks=current_user.tasks.all.order(priority: :desc).page(params[:page]).per(4)
    elsif params[:name].blank? && params[:statut]
      @tasks = current_user.tasks.where(statut:params[:statut]).page(params[:page]).per(4)
    elsif params[:name] && params[:statut]
      @tasks = current_user.tasks.where(name: params[:name]).where(statut:params[:statut]).page(params[:page]).per(4)
    else
      @tasks=current_user.tasks.all.order(created_at: :desc).page(params[:page]).per(4)
    end
  end
  def new
    @task = Task.new
  end
  def create
    #@task = Task.new (task_params)
    #@task.user_id = current_user.id
    @task =current_user.tasks.build(task_params)
    if @task.save
      flash[:success] = 'Task successfully create !'
      redirect_to user_path(current_user.id)
    else
      render :new
    end
  end
  def show
  end
  def edit

  end
  def update
    if @task.update(task_params)
      flash[:success] = 'Task successfully update !'
      redirect_to admin_users_path
    else
      render :edit
    end
  end
  def destroy
    @task.destroy
    flash[:success] = 'Task successfully destroy !'
    redirect_to admin_users_path
  end
private
  def task_params
    params.require(:task).permit(:name,:content,:end_time,:statut, :priority)
  end
  def set_task
    @task = Task.find(params[:id])
  end
  def user_check
    redirect_to tasks_path, notice:('access deny') unless current_user.id == @task.user_id || current_user.admin?
  end
  def login_check
    redirect_to new_session_path, notice:('you are not login, please login or create new accompt') unless logged_in?
  end
end
