class Problem < ActiveRecord::Base
  attr_accessible :content, :tag_list

  belongs_to :user
  validates_associated :user

  has_many :watches
  has_many :watching_users, through: :watches
  validates_associated :watches
  validates_associated :watching_users

  has_many :answers
  validates_associated :answers

  has_many :references
  validates_associated :references

  has_many :logs, as: :loggable
  validates_associated :logs
  
  validates :content, presence: true

  acts_as_taggable
end
