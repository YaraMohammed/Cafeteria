class OrderProduct < ApplicationRecord
	belongs_to :product, :dependent => :destroy  
	belongs_to :order, :dependent => :destroy

  

end
