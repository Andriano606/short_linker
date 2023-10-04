# frozen_string_literal: true

class Link::Operation::Index < Operation::Base
  def perform!(params)
    result[:model] = params[:user].links
  end
end
