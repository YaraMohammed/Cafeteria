class Order < ApplicationRecord
	belongs_to :user, :dependent => :destroy
	has_many :products, through: :order_products, :dependent => :destroy
end
