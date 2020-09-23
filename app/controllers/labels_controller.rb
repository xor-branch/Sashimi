class LabelsController < ApplicationController
  before_action :set_label, only: [:edit, :update, :destroy]
  def new
    @label = Label.new
  end
  def edit
  end
  def create
    @label = Label.new (label_params)
    @label.user_id = current_user.id
    @label.save
    flash[:success] = 'label successfully create !'
    redirect_to user_path(current_user.id)
  end
  def update
    if @label.update(label_params)
      flash[:success] = 'Label successfully update !'
      redirect_to user_path(current_user.id)
    else
      render :edit
    end
  end
  def destroy
    @label.destroy
    flash[:success] = 'label successfully destroy !'
    redirect_to user_path(current_user.id)
  end
  private
  def label_params
    params.require(:label).permit(:name)
  end
  def set_label
    @label = Label.find(params[:id])
  end
end
