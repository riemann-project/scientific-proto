class Image < ActiveRecord::Base
  attr_accessible :image
  
  belongs_to :user
  validates_associated :user

  mount_uploader :image, ImageUploader
  validates_presence_of :image
end
