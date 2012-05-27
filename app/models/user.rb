class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :token_authenticatable, :authentication_keys => [:student_id]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation,:remember_me,
                  :grade, :name, :department, :course, :student_id, :avatar
  # attr_accessible :title, :body
  
  # attr_accessible :login
  
  validates :email, uniqueness: true
  validates :name, uniqueness: { case_sensitive: false }
  validates :student_id, uniqueness: true
  
  has_many :problems
  validates_associated :problems
  
  has_many :answers
  validates_associated :answers
  has_many :discussions
  validates_associated :discussions
  has_many :references
  validates_associated :references
  
  has_many :images
  validates_associated :images

  has_many :watches
  validates_associated :watches
  has_many :watched_problems, :through => :watches
  validates_associated :watched_problems
  
  has_many :follows
  validates_associated :follows
  has_many :followings, class_name: "User", through: :follows
  validates_associated :followings
  has_many :followeds, class_name: "Follow", foreign_key: :followed_id
  validates_associated :followeds
  has_many :followers, class_name: "User", through: :followeds
  validates_associated :followers
  
  has_many :interests
  validates_associated :interests
  has_many :interesting_discussions, class_name: "Discussion", through: :interests
  validates_associated :interesting_discussions
  
  has_many :votes
  validates_associated :votes
  
  has_many :usefuls
  validates_associated :usefuls
  has_many :useful_references, class_name: "Reference", through: :usefuls
  validates_associated :useful_references
  
  has_many :user_badges
  validates_associated :user_badges
  has_many :badges, through: :user_badges
  validates_associated :badges
  
  has_many :logs
  validates_associated :logs
  
  mount_uploader :avatar, AvatarUploader
  
  before_validation do
    self.email = "j#{self.student_id}@ed.tus.ac.jp"
  end
  
  validates_numericality_of :student_id
  validates_inclusion_of :student_id, in: 6210001..7609999
end
