class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :token_authenticatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation,:remember_me,
                  :grade, :name, :department, :course, :student_id
  # attr_accessible :title, :body
  
  has_many :problems
  has_many :answers
  has_many :discussions
  has_many :references
  
  has_many :images

  has_many :watches
  has_many :watched_problems, :through => :watches
  
  has_many :follows
  has_many :followings, class_name: "User", through: :follows
  has_many :followeds, class_name: "Follow", foreign_key: :followed_id
  has_many :followers, class_name: "User", through: :followeds
  
  has_many :interests
  has_many :interesting_discussions, class_name: "Discussion", through: :interests
  
  has_many :votes
  
  has_many :usefuls
  has_many :useful_references, class_name: "Reference", through: :usefuls
  
  has_many :user_badges
  has_many :badges, through: :user_badges
  
  has_many :logs
  
  before_validation do
    self.email = "j#{self.student_id}@ed.tus.ac.jp"
  end
  
  validates_numericality_of :student_id
  validates_inclusion_of :student_id, in: 6210001..7609999
end
