class OrderController < ApplicationController

	def index
		@orders = Order.main_page

		respond_to do |format|
	      format.html
	      format.json {render json: @orders }
	    end
	end
end
