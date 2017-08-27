class PaymentController < ApplicationController
	before_action :authenticate_user!


	def new
	end

	def create
		Payment.create(
			from_id: params[:from],
			to_id: params[:to],
			price: params[:price])

	end
end
