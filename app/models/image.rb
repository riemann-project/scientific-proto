class Image < ActiveRecord::Base
  attr_accessible :image
  mount_uploader :image, ImageUploader
  belongs_to :user
  
  # validates_presence_of :image
end
