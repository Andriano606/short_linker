# frozen_string_literal: true

class Subscription::Component::CardModal < ViewComponent::Base
  def initialize; end

  def modal_id
    @modal_id ||= "card_modal_#{SecureRandom.random_number(1_000_000)}"
  end
end
