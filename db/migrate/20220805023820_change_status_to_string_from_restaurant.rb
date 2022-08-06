class ChangeStatusToStringFromRestaurant < ActiveRecord::Migration[6.1]
  def change
    change_column :restaurants, :status, :string
  end
end
