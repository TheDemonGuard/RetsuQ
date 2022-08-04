class CreateRestaurants < ActiveRecord::Migration[6.1]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.string :category
      t.string :price_range
      t.integer :open_time
      t.integer :close_time
      t.boolean :status
      t.integer :capacity
      t.integer :total_wait_time
      t.integer :time_per_person
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
