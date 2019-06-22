class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  def show
    authorize @user
    render json: @user
  end

  def new
    @user = User.new
    authorize @user
  end

  def create
    @user = User.new(user_params)
    authorize @user
    if @user.save
      redirect_to @user
    else
      render :new
    end
  end

  def edit
    authorize @user
  end

  def update
    authorize @user
    if @user.update(update_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :email)
  end

  def update_params
    params.require(:user).permit(:password)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
