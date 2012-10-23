namespace :photos do
  task :clean do

    # Clean all photos
    Photo.delete_all

    # delete all files remaining on S3
    AWS::S3::Base.establish_connection!(
      :access_key_id     => ENV["AWS_ACCESS_KEY_ID"],
      :secret_access_key => ENV['AWS_SECRET_KEY_ID'],
      :server            => 's3-eu-west-1.amazonaws.com'
    )

    # This is shit !
    AWS::S3::DEFAULT_HOST.replace 's3-eu-west-1.amazonaws.com'

    AWS::S3::Bucket.find(ENV["S3_BUCKET"])
  end
end

