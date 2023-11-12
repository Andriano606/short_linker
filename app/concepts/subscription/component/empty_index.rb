# frozen_string_literal: true

class Subscription::Component::EmptyIndex < ViewComponent::Base
  def initialize(**)
    return if ENV['SUBSCRIPTION_PLANS'].nil?

    @available_subscription_plans = [] # eval(ENV['SUBSCRIPTION_PLANS'].tr("'", '"'))
  end
end
