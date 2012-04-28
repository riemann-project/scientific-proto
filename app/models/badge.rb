class Badge < ActiveRecord::Base
  attr_accessible :name
  has_many :user_badges, foreign_key: :badge_id
end
