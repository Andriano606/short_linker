# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include OperationsMethods

  before_action :authenticate_user!
  helper_method :current_user, :logged_in?

  def logged_in?
    !!current_user
  end
end
