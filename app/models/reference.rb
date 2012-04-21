class Reference < ActiveRecord::Base
  attr_accessible :content
  belongs_to :user
  belongs_to :referable, :polymorphic => true
end