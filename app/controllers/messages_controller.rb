class MessagesController < ApplicationController
  before_action :set_chat, only:[:index, :create]
  before_action :authenticate_user!

  def index
    @messages = @chat.messages.all
    @messages = @messages.sort_by(&:created_at)
  end

  def create
    @message = current_user.messages.build(message_params)
    @message.save
  end

  private

  def set_chat
    @chow = Chat.find(params[:chat_id])
  end


  def message_params
    params.require(:message).permit(:content, :sender_id, :recipient_id, :chat_id)
  end

end
