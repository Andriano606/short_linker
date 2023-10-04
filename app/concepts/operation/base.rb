# frozen_string_literal: true

class Operation::Base
  class_attribute :result

  def initialize(**params)
    @result = { model: nil }

    perform!(params)

    return_method
  end

  def self.call(**args)
    ops = new(**args)
    ops.result
  end

  def return_method
    @result
  end
end
