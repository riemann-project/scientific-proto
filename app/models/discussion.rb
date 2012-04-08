class Discussion < ActiveRecord::Base
  attr_accessible :content, :discussable_id, :discussable_type, :user_id
end
