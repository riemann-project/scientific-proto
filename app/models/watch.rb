class Watch < ActiveRecord::Base
  attr_accessible :problem_id
  belongs_to :watching_user, class_name: "User", foreign_key: :user_id
  belongs_to :watched_problem, class_name: "Problem", foreign_key: :problem_id
end
