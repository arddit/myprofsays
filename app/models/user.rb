class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts

  has_many :votes, dependent: :destroy
  has_many :upvoted_posts, through: :votes, source: :post

  extend FriendlyId
  friendly_id :username, use: :slugged

  attr_accessor :login

  validates :username,
  :presence => true,
  :uniqueness => { :case_sensitive => false }

	validate :validate_username

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end

	def validate_username
	  if User.where(email: username).exists?
	    errors.add(:username, :invalid)
	  end
	end
		
end
