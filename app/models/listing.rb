class Listing < ActiveRecord::Base
  # Validations
	validates :property_type, presence: true
	validates :room_type, presence: true
	validates :no_of_guests, presence: true
	validates :city, presence: true

	belongs_to :user
	has_many :reservations
	mount_uploaders :images, ImageUploader
	searchkick  # autocomplete: ['country'] - this isn't working.




	# Need to figure out how this works. So that only 'active' listings are indexed and show up in search results.
  # def should_index?
  #   # only index listings where published == true
  # end

end
