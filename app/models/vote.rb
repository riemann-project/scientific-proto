class Vote < ActiveRecord::Base
  attr_accessible :answer_id, :value
  belongs_to :user
  belongs_to :answer
end
