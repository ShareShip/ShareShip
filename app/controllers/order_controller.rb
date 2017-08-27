class OrderController < ApplicationController
	before_action :authenticate_user!, only: [:new]

	  
	def new

	end

	def create 
		u = current_user
		v = Vendor.find_by(name: params["order"]["vendor_name"])
		if !v.present?
			v = Vendor.create(name: params["order"]["vendor_name"])
			Order.create!(
			  		user_id: u.id,
			  		vendor_id: v.id,
			  		name: params["order"]["product_name"],
			  		price: params["order"]["price"],
			  		shipping: params["order"]["shipping"],
			  		quantity: params["order"]["quantity"],
			  		date: Time.now,
			  		city: params["order"]["city"])
			redirect_to orders_url
		else
			Order.create!(
			  		user_id: u.id,
			  		vendor_id: v.id,
			  		name: params["order"]["product_name"],
			  		price: params["order"]["price"],
			  		shipping: params["order"]["shipping"],
			  		quantity: params["order"]["quantity"],
			  		date: Time.now,
			  		city: params["order"]["city"])
			redirect_to orders_url
		end

	end

	def index
		@orders = Order.main_page

		respond_to do |format|
	      format.html
	      format.json {render json: @orders }
	    end
	end
end
