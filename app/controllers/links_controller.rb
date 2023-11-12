# frozen_string_literal: true

class LinksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:redirect]

  def index
    endpoint Link::Operation::Index, Link::Component::Index
  end

  def destroy
    endpoint Link::Operation::Destroy do
      redirect_to root_path
    end
  end

  def create
    endpoint Link::Operation::Create do |result|
      flash.alert = result[:errors] if result[:errors].present?

      redirect_to root_path
    end
  end

  def redirect
    redirect_to Link.find_by(short_link: params[:short_link]).full_link,
                allow_other_host: true
  rescue StandardError
    raise ActionController::RoutingError, 'Not Found'
  end
end
