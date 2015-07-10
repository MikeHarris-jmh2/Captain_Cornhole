class Message < ActiveRecord::Base




  private

  def self.TWILIO_CLIENT
  Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']

  end
end
