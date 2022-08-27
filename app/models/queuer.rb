class Queuer < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant

  STATUS = ['queuing', 'dining', 'completed']
  validates :size, presence: true, numericality: { only_integer: true }

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
    time = Time.now + (wait_time * 60)
    return time.strftime("%I:%M %p")
  end
end
