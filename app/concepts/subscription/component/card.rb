# frozen_string_literal: true

class Subscription::Component::Card < ViewComponent::Base
  def initialize(subscription_plan)
    @subscription_plan = subscription_plan
  end
end
