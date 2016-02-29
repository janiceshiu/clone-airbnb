CarrierWave.configure do |config|
  config.fog_provider = "fog/aws"
  config.fog_credentials = {
    provider:               "AWS",
    aws_access_key_id:      ENV["s3_key"],
    aws_secret_access_key:  ENV["s3-secret"],
    region:                 "ap-southeast-1",
    host: 									"https://s3-ap-southeast-1.amazonaws.com/",
    endpoint:  							"https://s3-ap-southeast-1.amazonaws.com/airbnb-clone-site"
  }
  config.fog_directory  = 'airbnb-clone-site'
  config.fog_public     = false                                        # optional, defaults to true
  config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" } # optional, defaults to {}
end