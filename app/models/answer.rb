class Answer < ActiveRecord::Base
  attr_accessible :title, :content, :problem_id

  belongs_to :user

  belongs_to :problem

  has_many :discussions, as: :discussable

  has_many :votes

  has_many :logs, as: :loggable
end
