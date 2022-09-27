class ChatroomController < ApplicationController
  def show

  end

  def destroy

  end

  def index
    @messages = Message.order("created_at DESC").paginate(page: params[:page], per_page: 10)
  end
end