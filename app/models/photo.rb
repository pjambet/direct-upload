class Photo < ActiveRecord::Base
  attr_accessible :name, :description, :file

  mount_uploader :file, PhotoUploader
end
