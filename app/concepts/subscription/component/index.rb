# frozen_string_literal: true

class Subscription::Component::Index < ViewComponent::Base
  def initialize(model:, **)
    @subscription = model
  end
end
