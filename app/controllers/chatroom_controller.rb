class ChatroomController < ApplicationController
  include ApplicationHelper

  before_action :required_user_helper

  def show

  end

  def destroy

  end

  def index
    @message = Message.new
    @messages = Message.paginate(page: params[:page], per_page: 10)
  end
end