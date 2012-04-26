class Discussion < ActiveRecord::Base
  attr_accessible :title, :content, :user_id
  belongs_to :user
  belongs_to :discussable, :polymorphic => true
  has_many :discussions, :as => :discussable
  has_many :interests
  has_many :interested_users, through: :interests
  
  def super_answer
    discussable_type == "Answer" ? discussable : discussable.super_answer
  end
  
  def problem
    super_answer.problem
  end
end
