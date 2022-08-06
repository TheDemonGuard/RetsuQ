class Restaurant < ApplicationRecord
  belongs_to :user
  has_many :queuers
  has_many_attached :photo

  validates :name, presence: true
  validates :address, presence: true
  validates :category, presence: true
  validates :open_time, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 24}
  validates :close_time, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 24}
  validates :capacity, presence: true
  validates :time_per_person, presence: true, numericality: { only_integer: true }
end
