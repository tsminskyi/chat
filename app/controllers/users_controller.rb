class UsersController < ApplicationController

  before_action :logged_in_redirect, only: [:new]
  include ApplicationHelper

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      OnlineUser.create!(user_id: @user.id)
      flash[:success] = "Wellcome #{@user.username}"
      redirect_to root_path
    else
      render "new", status: 422
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password_digest)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def logged_in_redirect
    if logged_in_helper?
      flash[:error] = "You are already logged in"
      redirect_to root_path
    end
  end

end
