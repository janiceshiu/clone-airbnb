class User < ActiveRecord::Base
  include Clearance::User
  has_many :listings
  has_many :reservations
end
