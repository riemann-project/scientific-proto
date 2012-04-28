class Answer < ActiveRecord::Base
  attr_accessible :content, :problem_id
  belongs_to :user
  belongs_to :problem
  has_many :discussions, as: :discussable
  
  has_many :usefuls
  has_many :usefuled_user, class_name: "User", through: :usefuls
end
