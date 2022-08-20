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
end
