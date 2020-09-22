class LabelsController < ApplicationController
  def new
    @label = Label.new
  end
  def create
    @label = Label.new (label_params)
    @label.user_id = current_user.id
    @label.save
    flash[:success] = 'label successfully create !'
    redirect_to user_path(current_user.id)
  end

  def destroy
    @label = Label.find(params[:id])
    @label.destroy
    flash[:success] = 'label successfully destroy !'
    redirect_to user_path(current_user.id)
  end
  private
  def label_params
    params.require(:label).permit(:name)
  end
end
