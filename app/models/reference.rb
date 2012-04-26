class Reference < ActiveRecord::Base
  attr_accessible :problem_id, :content
  belongs_to :user
  belongs_to :problem
end
