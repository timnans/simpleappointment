class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.references :room, null: false, foreign_key: true
      t.datetime :start
      t.datetime :end
      t.string :purpose

      t.timestamps
    end
  end
end
