# frozen_string_literal: true

class Link::Operation::Index < Operation::Base
  def perform!(user:)
    self.model = user.links
  end
end
