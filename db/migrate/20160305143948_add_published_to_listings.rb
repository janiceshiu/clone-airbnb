class AddPublishedToListings < ActiveRecord::Migration
  def change
    add_column :listings, :published, :boolean, default: false
  end
end
