class AddReservationNameToQueuer < ActiveRecord::Migration[6.1]
  def change
    add_column :queuers, :reservation_name, :string
  end
end
