class User < ActiveRecord::Base
  include Clearance::User

  has_many :listings, :dependent => :destroy
  has_many :reservations, :dependent => :destroy
  has_many :authentications, :dependent => :destroy

  validates_presence_of :password, unless: :signup_with_facebook?, on: :create
  validates_presence_of :encrypted_password, unless: :signup_with_facebook?
  validates_confirmation_of :password, unless: :signup_with_facebook?, on: :create

  # attr_accessible :avatar # needed?
  mount_uploader :avatar, AvatarUploader

  def self.create_with_auth_and_hash(authentication,auth_hash)
    create! do |u|
      u.name = auth_hash["info"]["name"]
      u.email = auth_hash["info"]["email"]
      u.avatar = auth_hash["info"]["image"] # test
      u.password = "dummy password"
      u.authentications<<(authentication)
    end
  end

  def signup_with_facebook?
    self.authentications.any?
  end

  def fb_token
    x = self.authentications.where(:provider => :facebook).first
    return x.token unless x.nil?
  end

  def password_optional?
    true
  end

end
