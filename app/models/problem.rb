class Problem < ActiveRecord::Base
  attr_accessible :content, :tag_list
  belongs_to :user
  
  has_many :watches
  has_many :watching_users, through: :watches
  
  has_many :answers
  has_many :references
  
  has_many :logs, as: :loggable
  
  acts_as_taggable
end
