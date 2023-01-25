class ChatroomController < ApplicationController
  include ApplicationHelper

  before_action :required_user_helper

  def show

  end

  def destroy

  end

  def index
    @message = Message.new
    @online_users = OnlineUser.all
    # @messages = Message.paginate(page: params[:page], per_page: 10)
    @messages = Message.custom_display
  end
end