CarrierWave.configure do |config|
  if true #(Rails.env.production? || Rails.env.staging?) && ENV['AWS_ACCESS_KEY_ID'] && ENV['AWS_SECRET_ACCESS_KEY'] && ENV['S3_BUCKET']
    config.storage = :fog
    config.fog_credentials = {
      :provider               => 'AWS',
      :aws_access_key_id      => ENV['AWS_ACCESS_KEY_ID'],
      :aws_secret_access_key  => ENV['AWS_SECRET_ACCESS_KEY'],
      :region                 => 'eu-west-1'
    }
    config.fog_directory  = ENV['S3_BUCKET']
    config.fog_public     = false
  elsif Rails.env.development?
    config.storage = :file
  else
    config.storage = :file
    config.enable_processing = false
  end
end
