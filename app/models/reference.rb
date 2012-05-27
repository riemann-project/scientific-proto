class Reference < ActiveRecord::Base
  attr_accessible :problem_id, :content

  belongs_to :user
  validates_associated :user

  belongs_to :problem
  validates_associated :problem

  has_many :usefuls
  validates_associated :usefuls
  has_many :usefuled_user, class_name: "User", through: :usefuls
  validates_associated :usefuled_user
  
  has_many :logs, as: :loggable
  validates_associated :logs
end
