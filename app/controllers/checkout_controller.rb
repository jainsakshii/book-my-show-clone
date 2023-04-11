class CheckoutController < ApplicationController
  def create
    # @seat = Seat.find(params[:id])
    # @session = Stripe::Checkout::Session.create({
    #   payment_method_types: ['card'],
    #   line_items: [{
    #     price_data: {currency: 'inr',product_data: {name: @seat.name}, unit_amount: @seat.price},
    #     quantity: 1,
    #   } ],
    #   mode: 'payment',
    #   success_url: root_url,
    #   cancel_url: root_url,
    # })  
    @session = Stripe::Checkout::Session.create({
      byebug
      success_url: root_url,
      line_items: [
        {price: 'price_1MvgTCSD6cQ7Pxum0CBUdhvm', quantity: params[:no_of_tickets]},
      ],
      mode: 'payment',
      })
      
      respond_to do |format|
        format.js
      end
      
  end
end

# {price: 'price_1MvgTCSD6cQ7Pxum0CBUdhvm', quantity: params[:no_of_tickets].to_i},