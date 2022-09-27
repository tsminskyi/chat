class SessionsController < ApplicationController
  def new

  end

  def creat
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:notice] = 'Logged in successfully'
      redirect_to root_path
    else
      flash.now[:alert] = 'There was something wrong with your login credentials'
      render 'new'
    end
  end

  def destroy

  end
end