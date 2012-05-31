class Log < ActiveRecord::Base
  attr_accessible :loggable_id, :loggable_type, :action

  belongs_to :user
  validates_associated :user

  belongs_to :loggable, polymorphic: true
end
