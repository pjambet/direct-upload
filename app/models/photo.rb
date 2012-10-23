class Photo < ActiveRecord::Base
  attr_accessible :name, :description, :file
end
