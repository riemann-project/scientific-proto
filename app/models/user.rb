class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
  
  has_many :problems
  has_many :answers
  has_many :discussions
  has_many :references
  
  has_many :watches
  has_many :watched_problems, :through => :watches
  
  has_many :follows
  has_many :followings, class_name: "User", through: :follows
  has_many :followeds, class_name: "Follow", foreign_key: :followed_id
  has_many :followers, class_name: "User", through: :followeds
end
