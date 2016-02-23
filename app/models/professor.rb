class Professor < ActiveRecord::Base
	has_many :posts
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>", icon: "30x30>" }, default_url: "/images/:style/professor.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

	extend FriendlyId
  friendly_id :name, use: :slugged
end
