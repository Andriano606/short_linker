# frozen_string_literal: true

class SubscriptionsController < ApplicationController
  def index
    endpoint Subscription::Operation::Index do |result|
      if result[:model].nil?
        render Subscription::Component::EmptyIndex.new
      else
        render Subscription::Component::Index.new(model: result[:model])
      end
    end
  end

  def create
    # binding.irb

    # payment_method = Stripe::PaymentMethod.create(
    #   type: 'card',
    #   card: {
    #     token: 'your_test_token', # Use the token obtained from the client
    #     number: '4242424242424242',
    #     exp_month: 12,
    #     exp_year: 2023,
    #     cvc: '123'
    #   }
    # )
    #
    # customer = Stripe::Customer.create(
    #   payment_method: payment_method.id,
    #   email: current_user.email,
    #   description: "User id: #{current_user.id}"
    # )
    #
    # charge = Stripe::Charge.create({
    #                                  customer: customer.id,
    #                                  amount: 10,
    #                                  description: 'For annual subscription',
    #                                  currency: 'uah'
    #                                })
  rescue Stripe::CardError
    # flash[:error] = e.message
    # redirect_to new_payment_path
  end
end
