class Listing < ActiveRecord::Base
  # Validations for creating listing.
	validates :property_type, presence: true
	validates :room_type, presence: true
	validates :no_of_guests, presence: true
	validates :city, presence: true

	belongs_to :user
	has_many :reservations
	mount_uploaders :images, ImageUploader

	# Must do this for other fields too. (eg: city, state, etc)
	searchkick match: :word_start, searchable: [:country], autocomplete: [:country]

	# Validations for publishing listing.
	with_options if: :valid_to_publish? do |listing|
    listing.validates :description, presence: true

  end


	# Need to figure out how this works. So that only 'active' listings are indexed and show up in search results.
  # def should_index?
  #   # only index listings where published == true
  # end

  def valid_to_publish?
  	published == true

  end
end
