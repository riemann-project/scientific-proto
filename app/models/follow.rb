class Follow < ActiveRecord::Base
  attr_accessible :followed_id
  
  belongs_to :following, class_name: :user, foreign_key: :user_id
  belongs_to :follower, class_name: :user, foreign_key: :followed_id
end
