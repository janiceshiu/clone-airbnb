class Listing < ActiveRecord::Base
	belongs_to :user
	has_many :reservations
	mount_uploaders :images, ImageUploader
	searchkick match: :word_start, searchable: [:country]

  def search_data
    {
      property_type: property_type,
      room_type: room_type,
      city: city,
      postcode: postcode,
      state: state,
      country: country,
      no_of_guests: no_of_guests,
      no_of_bedrooms: no_of_bedrooms,
      no_of_bathrooms: no_of_bathrooms,
      no_of_beds: no_of_beds
    }
  end

	 # searchkick autocomplete: ['country']
end
