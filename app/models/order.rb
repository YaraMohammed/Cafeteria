class Order < ApplicationRecord
	belongs_to :user, :dependent => :destroy
	has_many :order_products
	has_many :products, through: :order_products, :dependent => :destroy
end
