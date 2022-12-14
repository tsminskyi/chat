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
      # respond_to do |format|
      #   format.turbo_stream do
      #     render turbo_stream: turbo_stream.append(:messages, partial: "messages/message",
      #                                              locals: { message: @message })
      #   end
      #   # format.turbo_stream
      #   format.html { redirect_to root_path }
      # end
    else

    end
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end

end