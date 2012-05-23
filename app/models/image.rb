class Image < ActiveRecord::Base
  attr_accessible :image
  mount_uploader :image, ProblemImageUploader
  belongs_to :user
end
