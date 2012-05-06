class Vote < ActiveRecord::Base
  attr_accessible :answer_id, :user_id, :value
end
