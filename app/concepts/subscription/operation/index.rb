# frozen_string_literal: true

class Subscription::Operation::Index < Operation::Base
  def perform!(user:, **)
    self.model = user.subscription
  end
end
