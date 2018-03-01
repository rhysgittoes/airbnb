CarrierWave.configure do |config|
  config.ignore_integrity_errors = false
  config.ignore_processing_errors = false
  config.ignore_download_errors = false


  config.fog_provider = 'fog/aws'                        # required
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:      ENV['S3_KEY'],                        # required
    aws_secret_access_key:  ENV['S3_SECRET'],                        # required
    region:                'ap-southeast-1',                  # optional, defaults to 'us-east-1'
    # host:                  's3.example.com',             # optional, defaults to nil
    # endpoint:              'https://s3.example.com:8080' # optional, defaults to nil
  }
  config.fog_directory  = 'pairbnbphotos'                                   # required
  # config.fog_public     = false                                                 # optional, defaults to true
  # config.fog_attributes = { cache_control: "public, max-age=#{365.days.to_i}" } # optional, defaults to {}


   #Use local storage if in development or test
  # if Rails.env.development? || Rails.env.test?
  #   CarrierWave.configure do |config|
  #     config.storage = :file
  #   end
  # end
  
  # #Use AWS storage if in production
  # if Rails.env.production?
  #   CarrierWave.configure do |config|
  #     config.storage = :fog
  #   end
  # end
  
  # config.fog_credentials = {
  #   :provider               => 'AWS',                             # required
  #   :aws_access_key_id      => '<your key goes here>',            # required
  #   :aws_secret_access_key  => '<your secret key goes here>',     # required
  #   :region                 => 'eu-west-1'                        # optional, defaults to 'us-east-1'
  # }
  # config.fog_directory  = '<bucket name goes here>'               # required
  # #config.fog_host       = 'https://assets.example.com'           # optional, defaults to nil
  # #config.fog_public     = false                                  # optional, defaults to true
  # config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}



end