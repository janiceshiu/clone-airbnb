class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.integer  "user_id"
	    t.text     "description"
	    t.string   "property_type"
	    t.string   "room_type"
	    t.string   "street_address"
	    t.string   "city"
	    t.string   "postcode"
	    t.string   "state"
	    t.string   "country"
	    t.integer  "no_of_guests"
	    t.integer  "no_of_bedrooms"
	    t.integer  "no_of_bathrooms"
	    t.integer  "no_of_beds"
	    t.integer  "min_stay"
	    t.integer  "rent_per_night"
	    t.text     "house_rules"
	    t.datetime "created_at",      null: false
	    t.datetime "updated_at",      null: false
      t.timestamps null: false
    end
  end
end
