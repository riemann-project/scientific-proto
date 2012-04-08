class Answer < ActiveRecord::Base
  attr_accessible :content, :problem_id, :user_id
  belongs_to :problem
end
