class MessagesController < ApplicationController
  include ApplicationHelper

  before_action :required_user_helper

  def creat
    message = current_user_helper.messages.build(message_params)
    if message.save
      redirect_to root_path
    end
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end

end