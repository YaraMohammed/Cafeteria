class User < ApplicationRecord
	has_many :orders
	has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
	validates :name, presence: true
	validates :room, presence: true
	validates :email, presence: true
	validates :password, confirmation: true
  	validates :password_confirmation, presence: true

  	self.per_page = 1
end
WillPaginate.per_page = 1