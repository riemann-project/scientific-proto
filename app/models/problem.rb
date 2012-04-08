class Problem < ActiveRecord::Base
  attr_accessible :content, :user_id
  has_many :answers
end
