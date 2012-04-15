class Discussion < ActiveRecord::Base
  attr_accessible :title, :content
  belongs_to :discussable, :polymorphic => true
  has_many :discussions, :as => :discussable
  has_many :references, :as => :referable
  
  def super_answer
    discussable_type == "Answer" ? discussable : discussable.super_answer
  end
  
  def problem
    super_answer.problem
  end
end
