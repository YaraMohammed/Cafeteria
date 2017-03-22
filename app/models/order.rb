class Order < ApplicationRecord
	
	belongs_to : Users
	has_many : Products

end
