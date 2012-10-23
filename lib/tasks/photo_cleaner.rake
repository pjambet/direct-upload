namespace :photos do
  task :clean => :environment do

    # Clean all photos
    p "Deleting photos"
    p "#{Photo.delete_all} photos deleted"

    # delete all files remaining on S3
    AWS::S3::Base.establish_connection!(
      :access_key_id     => ENV["AWS_ACCESS_KEY_ID"],
      :secret_access_key => ENV['AWS_SECRET_KEY_ID'],
      :server            => 's3-eu-west-1.amazonaws.com'
    )

    # This is shit !
    AWS::S3::DEFAULT_HOST.replace 's3-eu-west-1.amazonaws.com'

    p "Cleaning Bucket"
    AWS::S3::Bucket.find(ENV["S3_BUCKET"]).delete_all
  end
end

