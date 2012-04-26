class Interest < ActiveRecord::Base
  attr_accessible :discussion_id
  belongs_to :user
  belongs_to :interesting_discussion, class_name: "Discussion", foreign_key: :discussion_id
  belongs_to :interested_user, class_name: "User", foreign_key: :user_id
end
