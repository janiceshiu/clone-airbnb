class User < ActiveRecord::Base
  include Clearance::User
  has_many :listings
  has_many :reservations

  # attr_accessible :avatar # needed?
  mount_uploader :avatar, AvatarUploader
end
