class Queuer < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant

  STATUS = ['queuing', 'dining', 'completed']
  validates :size, presence: true, numericality: { only_integer: true }

  after_create :reminder

  # Notify our queuer X minutes before their
  def reminder
    @twilio_number = ENV['TWILIO_NUMBER']
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    @client = Twilio::REST::Client.new account_sid, ENV['TWILIO_AUTH_TOKEN']
    time_str = ((self.time).localtime).strftime("%I:%M%p on %b. %d, %Y")
    body = "Hi #{self.name}. Just a reminder that your turn is coming up at #{time_str}."
    message = @client.messages.create(
      :from => @twilio_number,
      :to => user.phone,
      :body => body
    )
  end

  def when_to_run
    minutes_before_reservation = 30.minutes
    time - minutes_before_reservation
  end

  handle_asynchronously :reminder, :run_at => Proc.new { |i| i.when_to_run }
end
