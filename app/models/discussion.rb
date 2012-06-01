class Discussion < ActiveRecord::Base
  attr_accessible :title, :content, :user_id

  belongs_to :user
  validates_associated :user

  belongs_to :discussable, :polymorphic => true
  validates_associated :discussable
  has_many :discussions, :as => :discussable
  validates_associated :discussions

  has_many :interests
  validates_associated :interests
  has_many :interested_users, through: :interests
  validates_associated :interested_users

  has_many :logs, as: :loggable
  validates_associated :logs

  def super_answer
    discussable_type == "Answer" ? discussable : discussable.super_answer
  end

  def problem
    super_answer.problem
  end
end
