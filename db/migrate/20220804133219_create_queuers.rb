class CreateQueuers < ActiveRecord::Migration[6.1]
  def change
    create_table :queuers do |t|
      t.integer :size
      t.string :status
      t.integer :actual_wait_time
      t.references :user_id, null: false, foreign_key: true
      t.references :restaurant_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
