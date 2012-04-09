class Answer < ActiveRecord::Base
  attr_accessible :content, :problem_id, :user_id
  belongs_to :problem
  has_many :discussions, :as => :discussable
end
