class Watch < ActiveRecord::Base
  belongs_to :user
  has_one :problem
end
