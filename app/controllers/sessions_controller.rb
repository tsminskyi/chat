class SessionsController < ApplicationController
  include ApplicationHelper

  before_action :logged_in_redirect, only: [:new]

  def new

  end

  def creat
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:success] = 'Logged in successfully'
      OnlineUser.create!(user_id: @user.id)
      redirect_to root_path
    else
      flash.now[:error] = 'There was something wrong with your login credentials'
      render 'new'
    end
  end

  def destroy
    OnlineUser.find_by(user_id: session[:user_id]).destroy
    session[:user_id] = nil
    flash[:success] = 'You are successfully logged out'
    redirect_to login_path
  end

  private

  def logged_in_redirect
    if logged_in_helper?
      flash[:error] = "You are already logged in"
      redirect_to root_path
    end
  end
end