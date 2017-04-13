class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @users = User.all
  end

  def show
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      flash[:success] = "User info updated"
      redirect_to root
    else
      render :edit
    end
  end

  def destroy
  
  end
  
  private
    def user_params
      params.require[:user].permit(:user_name, :email, :encrypted_password)
    end
end
