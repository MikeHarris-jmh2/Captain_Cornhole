class Message < ActiveRecord::Base
  before_create :send_message

  

  private

  def send_message
    response = RestClient::Request.new(
      :method => :post,
      :url => 'https://api.twilio.com/2010-04-01/Accounts/AC6650453086e3f6940bf702113274bcbe/Messages.json',
      :user => ENV['TWILIO_ACCOUNT_SID'],
      :password => ENV['TWILIO_AUTH_TOKEN'],
      :payload => { :Body => body,
                    :From => from,
                    :To => to }
    ).execute
  rescue RestClient::BadRequest => error
    message = JSON.parse(error.response)['message']
    errors.add(:base, message)
  end
end
