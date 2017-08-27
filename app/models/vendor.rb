class Vendor < ApplicationRecord
	has_many :orders




	def store_page
		store_page = []
		orders.each do |o|
			store_page.push([o.city, o.name, o.price, o.quantity, o.date])
		end
		store_page
	end



end
