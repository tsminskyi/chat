class MessagesController < ApplicationController
  include ApplicationHelper

  before_action :required_user_helper
  skip_before_action :verify_authenticity_token

  def index
    @messages = Message.all
  end

  def create
    @message = Message.new({ body: message_params[:body], user: current_user_helper })
    # debugger
    if @message.save
      # Turbo::StreamsChannel.broadcast_append_to('main',
      #                                           target: "messages",
      #                                           partial: "messages/message",
      #                                           locals: { message: @message, users: current_user_helper })
      # respond_to do |format|
      #  format.js { "console.log('hhhh');" }
      # end
    else

    end
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end

end