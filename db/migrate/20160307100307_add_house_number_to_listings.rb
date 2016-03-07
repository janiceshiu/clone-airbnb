class AddHouseNumberToListings < ActiveRecord::Migration
  def change
    add_column :listings, :house_number, :string
  end
end
