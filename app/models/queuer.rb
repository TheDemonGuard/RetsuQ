class Queuer < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant

  STATUS = ['queuing', 'dining', 'completed']
  validates :reservation_name, presence: true
  validates :size, presence: true, numericality: { only_integer: true }

  # after_create :reminder

  # Notify our queuer X minutes before their
  def reminder(time = Time.now)
    return unless user.phone.present?
    @twilio_number = ENV['TWILIO_NUMBER']
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    @client = Twilio::REST::Client.new account_sid, ENV['TWILIO_AUTH_TOKEN']
    time_str = time.localtime.strftime("%I:%M%p on %b. %d, %Y")
    body = "Hi #{reservation_name}. Just a reminder that your turn is coming up at #{time_str}."
    message = @client.messages.create(
      :from => @twilio_number,
      :to => user.phone,
      :body => body
    )
  end

  def when_to_run
    # wait time is should be in minutes
    wait_time = wait_time.minutes
    turn_time = Time.now + wait_time
    turn_time - 15.minutes
  end

  #handle_asynchronously :reminder, :run_at => Proc.new { |i| i.when_to_run }

  def position
    queuers = self.restaurant.queuers.where(status: "queuing")
    queuers = queuers.sort_by { |queue| queue.created_at }
    index = queuers.find_index(self) + 1
    return index
  end

  def people
    queuers = self.restaurant.queuers.where(status: "queuing")
    queuers = queuers.sort_by { |queue| queue.created_at }
    queuers = queuers.take(position)
    # <!-- number of people waiting in the queue -->
    number_of_people = 0
    queuers.each do |group|
      number_of_people += group.size
    end
    return number_of_people
  end

  def people_ahead_in_queue
    people_ahead = people - self.size
    return people_ahead
  end

  def wait_time
    self.restaurant.time_per_person * people_ahead_in_queue
  end

  def estimated
    time = Time.zone.now  + (wait_time * 60)
    return time.strftime("%I:%M %p")
  end

end
