class Post < ActiveRecord::Base
  belongs_to :professor
  belongs_to :user

  has_many :votes, dependent: :destroy
  has_many :upvoted_users, through: :votes, source: :user

  extend FriendlyId
  friendly_id :text, use: :slugged
end
