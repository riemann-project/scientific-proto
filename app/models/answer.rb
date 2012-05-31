class Answer < ActiveRecord::Base
  attr_accessible :title, :content, :problem_id
  validates :title, :content, presence: true

  belongs_to :user
  # validates_associated :user

  belongs_to :problem
  # validates_associated :problem

  has_many :discussions, as: :discussable
  # validates_associated :discussions

  has_many :votes
  # validates_associated :votes

  has_many :logs, as: :loggable
  # validates_associated :logs
end
