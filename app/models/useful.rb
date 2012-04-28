class Useful < ActiveRecord::Base
  attr_accessible :answer_id
  belongs_to :useful_answer, class_name: "Answer", foreign_key: :answer_id
  belongs_to :usefuled_user, class_name: "User", foreign_key: :user_id
end
