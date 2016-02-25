class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer "user_id"
      t.integer "listing_id"
      t.integer "no_of_guests"
      t.date "check_in_date"
      t.date "check_out_date"
      t.timestamps null: false
    end
  end
end
