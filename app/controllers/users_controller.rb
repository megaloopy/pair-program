class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @user = User.all
  end

  def show
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.save
      redirect user_path
    else
      render 'edit'
    end
  end

  def delete
  end
end
