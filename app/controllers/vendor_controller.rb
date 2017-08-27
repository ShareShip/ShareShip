class VendorController < ApplicationController

	def index
		@vendors = Vendor.all_stores

		respond_to do |format|
	      format.html
	      format.json {render json: @vendors }
	    end
	end

	def show
		vendor = Vendor.find_by(name: params[:name])
		if vendor.present?
			@vendor = vendor
			respond_to do |format|
		      format.html
		      format.json {render json: @vendor.store_page }
		    end
		else
			@vendor = Vendor.create(name: params[:name])
			respond_to do |format|
		      format.html
		      format.json {render json: @vendor.store_page }
		    end
		end
	end

end
