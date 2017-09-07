class ChatsController < ApplicationController

  before_action :set_user, only: [ :new, :create, :index ]

  def new
    @chat = Chat.new
  end

  def create
    @chat = Chat.new(chat_params)
    @chat.user1 = current_user
    @chat.user2 = User.find(chat_params[:user_2_id])
    users_same = @chat.user1 == @chat.user2
    if !users_same
      @chat.save!
    end
  end

  def index
    user1_chats = Chat.where(user_1_id: @user.id)
    user2_chats = Chat.where(user_2_id: @user.id)

    @chats = user1_chats + user2_chats
  end

  private

  def chat_params
    params.require(:chat).permit(:user_1_id, :user_2_id)
  end

  def set_chat
    @chat = Chat.find(params[:id])
  end

  def set_user
    @user = User.find(current_user[:id])
  end
end
