class Follow < ActiveRecord::Base
  # attr_accessible :followed_id
  belongs_to :following, class_name: "User", foreign_key: :followed_id
  belongs_to :follower, class_name: "User", foreign_key: :user_id
end
