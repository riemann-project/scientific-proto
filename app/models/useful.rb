class Useful < ActiveRecord::Base
  attr_accessible :reference_id
  # belongs_to :useful_reference, class_name: "Reference", foreign_key: :reference_id
  belongs_to :reference
  belongs_to :usefuled_user, class_name: "User", foreign_key: :user_id
end
