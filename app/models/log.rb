class Log < ActiveRecord::Base
  attr_accessible :loggable_id, :loggable_type, :user_id
end
