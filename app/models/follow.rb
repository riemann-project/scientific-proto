class Follow < ActiveRecord::Base
  attr_accessible :followed_id, :user_id
end
