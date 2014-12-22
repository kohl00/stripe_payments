class Product < ActiveRecord::Base

	def price_form
		x = read_attribute(:price)*100
		return x.to_i
  	end
end
