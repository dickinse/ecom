# class PaymentsController < ApplicationController
#   def create
#   	token = params[:stripeToken]
#   	product = Product.find(params[:product_id])
#     @user = current_user
#   	begin
#   		charge = Stripe::Charge.create(
#   			:amount => product.price
#   			:currency => "usd",
#   			:source => token,
#   			:description => params[:stripeEmail]
#   		)
#
#       if charge.paid
#         Order.create(:product_id, :user_id, :total)
#       end
#
#   		flash[:success] = "Payment processed successfully"
#   	rescue Stripe::CardError => e
#   		# The card has been declined
#   		body = e.json_body
#   		err  = body[:error]
#   		flash[:error] = "Uhh, this doesn't normally happen to us...: #{err[:message]}"
#   	end
#   	redirect_to product_path(product)
#   end
# end


class PaymentsController < ApplicationController

def create
	token = params[:stripeToken]
	product = Product.find(params[:product_id])
	# Create the charge on Stripe's servers - this will charge the user's card
	begin
		charge = Stripe::Charge.create(
			:amount => 2000, # amount in cents, again
			:currency => "usd",
			:source => token,
			:description => params[:stripeEmail]
		)
		flash[:success] = "Payment processed successfully"
	rescue Stripe::CardError => e
		# The card has been declined
		body = e.json_body
		err  = body[:error]
    flash[:error] = "Uhh, this doesn't normally happen to us...: #{err[:message]}"
	end
	redirect_to product_path(product)
end

end
