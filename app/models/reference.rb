class Reference < ActiveRecord::Base
  attr_accessible :problem_id, :content

  belongs_to :user

  belongs_to :problem

  has_many :usefuls
  has_many :usefuled_user, class_name: "User", through: :usefuls
  
  has_many :logs, as: :loggable
end
