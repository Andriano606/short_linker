# frozen_string_literal: true

module OperationsMethods
  protected

  def endpoint(operation_class, view_class = nil)
    result = operation_class.call(params:, user: current_user)

    if block_given?
      yield result
      return
    end

    respond_to do |format|
      format.html { render view_class.new(model: result[:model]) }
    end
  end
end
