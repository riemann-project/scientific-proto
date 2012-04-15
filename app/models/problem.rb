class Problem < ActiveRecord::Base
  attr_accessible :content, :user_id
  has_many :answers
  has_many :references, :as => :referable
end
