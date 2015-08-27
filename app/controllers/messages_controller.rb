class MessagesController < ApplicationController
  def index
    @messages = Message.all
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    account_sid = 'AC6650453086e3f6940bf702113274bcbe'
    auth_token = 'bdae3003953d3658634b3bbec9e9e705'
    if @message.save
      @client = Twilio::REST::Client.new account_sid, auth_token
      @client.account.messages.create({
        :from => '+16572206463',
        :to => '+17142695412',
        :body => @message.body,
      })
      flash[:notice] = "Your message was sent!"
      redirect_to messages_path
    else
      render 'new'
    end
  end

  def new
    @message = Message.new
  end

  def show
    @message = Message.find(params[:id])
  end

  private
    def message_params
    params.require(:message).permit(:to, :from, :body)
  end
end
