class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  
  def show
    # @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
    if @user != current_user
      redirect_to root_url, alert: "Warning: illegal access!"
    end
  end
  
  def update
    if @user != current_user
      redirect_to root_url, alert: "Warning: illegal access!"
    elsif @user.update(user_params)
      flash[:success] = "Editing saved!"
      redirect_to @user , notice: "Profie updated."
    else
      render 'edit'
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :area)
  end
  
  def set_user
    @user = User.find(params[:id])
  end
end
