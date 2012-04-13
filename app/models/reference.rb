class Reference < ActiveRecord::Base
  attr_accessible :content, :referable_id, :referable_type, :user_id
end
