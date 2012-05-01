class ProblemImage < ActiveRecord::Base
  attr_accessible :image, :problem_id
  mount_uploader :image, ProblemImageUploader
  belongs_to :problem
end
