class Log < ActiveRecord::Base
  attr_accessible :loggable_id, :loggable_type, :action, :user_id

  belongs_to :user

  belongs_to :loggable, polymorphic: true
end
