class MessagesController < ApplicationController

  def new
    @user = User.find(params[:user_id])
    @message = @user.messages.build
  end

  def create
    @user = User.find(params[:user_id])
    @message = @user.messages.build(msg_params)
    if @message.save
      redirect_to user_path(@user)
    end
  end


  private
  def msg_params
    params.require(:message).permit(:content, :to_user).merge(from_user: current_user)
  end
end


def create
    @dog = Dog.find(params[:dog_id])
    @message = Message.new(msg_params)
    if @message.save
      redirect_to "/dogs/#{@dog.id}"
    else
      render :new
    end
  end
