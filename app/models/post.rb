class Post < ActiveRecord::Base
  belongs_to :professor
  belongs_to :user

  extend FriendlyId
  friendly_id :text, use: :slugged
end
