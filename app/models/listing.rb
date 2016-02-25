class Listing < ActiveRecord::Base
	belongs_to :user
	mount_uploaders :images, ImageUploader
end
