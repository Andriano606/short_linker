# frozen_string_literal: true

class Link::Component::Index < ViewComponent::Base
  def initialize(model:, **)
    @links = model
  end
end
