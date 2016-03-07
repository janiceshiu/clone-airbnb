class AddLatAndLngToListings < ActiveRecord::Migration
  def change
    add_column :listings, :lat, :float
    add_column :listings, :lng, :float
  end
end
