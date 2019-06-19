class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  def show
    authorize @user
    render json: @user
  end

  private

  def user_params
    # params.require(:user).permit()
  end

  def update_params
    params.require(:user).permit(:username, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
