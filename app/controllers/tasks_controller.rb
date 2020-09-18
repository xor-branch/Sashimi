class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  PER = 4
  def index

    #@statut = params[:statu].to_i
    if params[:sort_expired]
      @tasks=Task.all.order(end_time: :desc).page(params[:page]).per(4)
    elsif params[:sort_priority]
      @tasks=Task.all.order(priority: :desc).page(params[:page]).per(4)
    elsif params[:name].blank? && params[:statut]
      @tasks = Task.where(statut:params[:statut]).page(params[:page]).per(4)
    elsif params[:name] && params[:statut]
      @tasks = Task.where(name: params[:name]).where(statut:params[:statut]).page(params[:page]).per(4)
    else
      @tasks=Task.all.order(created_at: :desc).page(params[:page]).per(4)
    end

  end
  def new
    @task = Task.new
  end
  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:success] = 'Task successfully create !'
      redirect_to tasks_path
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
      redirect_to tasks_path
    else
      render :edit
    end
  end
  def destroy
    @task.destroy
    flash[:success] = 'Task successfully destroy !'
    redirect_to tasks_path
  end
private
  def task_params
    params.require(:task).permit(:name,:content,:end_time,:statut, :priority)
  end
  def set_task
    @task = Task.find(params[:id])
  end
end
