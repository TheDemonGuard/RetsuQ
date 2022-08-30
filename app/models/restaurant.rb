class Restaurant < ApplicationRecord
  belongs_to :user
  has_many :queuers
  has_many :reviews

  # cloudinary settings
  has_many_attached :photos

  # geocoder settings
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address? # run geocode only if a change to the address has been made

  # validations
  validates :name, presence: true
  validates :address, presence: true
  validates :category, presence: true
  validates :open_time, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 24}
  validates :close_time, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 24}
  validates :capacity, presence: true
  validates :time_per_person, presence: true, numericality: { only_integer: true }
  validates :description, presence: true, length: { minimum: 50 }

  STATUS = ["Closed temporarily", "Closed entire day", "Closed outside business hours", "Open"]
  MSG = ["Closed temporarily", "Closed entire day", "Closed outside business hours", "Open"]

  def status_string
    self.status = self.status == "1" ? "open" : "closed"
  end

  def current_status
    current_time = Time.now.hour
    @status = ""
    if current_time >= self.open_time && current_time < self.close_time
      @status = "Open"
    elsif self.open_time - 0.5 >= current_time && current_time != (20..24)
      @status = "Opening Soon at #{self.open_time} AM"
    else
      @status = "Closed"
    end
    @status
  end

  def line_size
    self.queuers.where(status: "queuing").size
  end
  def queue_size
    self.queuers.where.not(status: "completed").sum(:size)
  end

  def wait_time
    if queue_size <= self.capacity
      wait_time = 0
    else
      wait_time = queue_size - capacity
      wait_time *= self.time_per_person
    end
    wait_time
  end
end
