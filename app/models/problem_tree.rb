class ProblemTree < ActiveRecord::Base
  attr_accessible :course, :date, :department, :grade, :name, :university

  has_one :problem
end
