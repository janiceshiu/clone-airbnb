class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer "reservation_id", index: true, foreign_key: true
      t.integer "total_payment"
      t.integer "processors_id_for_payment"
      t.timestamps null: false
    end
  end
end