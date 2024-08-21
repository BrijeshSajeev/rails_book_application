class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show, :update, :destroy]
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  def index
    @users = User.all
  end

  def show
    # if @user.email == current_user.email
    #   #
    # else
    #   redirect_to users_path, alert: 'You are not authorized to delete this user.'
    # end
  end

  def new
    @user = User.new
  end

  def create
    if @user.email == current_user.email
      @user = User.new(user_params)
      if @user.save
        redirect_to @user
      else
        render 'new'
      end
    else
      redirect_to users_path, alert: 'You are not authorized to create user.'
    end
  end

  def edit
  end

  def update
    if @user.email == current_user.email 
      if @user.update(user_params)
        redirect_to @user
      else
        render 'edit'
      end
    else
      redirect_to users_path, alert: 'You are not authorized to delete this user.'
    end
  end

  def destroy
    if @user.email == current_user.email
      @user.destroy
      redirect_to users_path
    else
      redirect_to users_path, alert: 'You are not authorized to delete this user.'
    end
  end

  private
 
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :sex, :email, :age, :image_new)
  end
end
