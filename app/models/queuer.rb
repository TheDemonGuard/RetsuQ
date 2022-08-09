class Queuer < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant

  STATUS = ['queuing', 'dining', 'completed']
  validates :size, presence: true, numericality: { only_integer: true }
end
