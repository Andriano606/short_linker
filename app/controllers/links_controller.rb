# frozen_string_literal: true

class LinksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:redirect]

  def index
    endpoint Link::Operation::Index, Link::Component::Index
  end

  def destroy
    link = Link.find(params[:link][:short_link])
    link.destroy!

    redirect_to root_path
  end

  def create
    current_user.links << Link.create!(full_link: params[:link][:full_link])

    redirect_to root_path
  end

  def redirect
    redirect_to Link.find(params[:short_link]).full_link,
                allow_other_host: true
  rescue StandardError
    raise ActionController::RoutingError, 'Not Found'
  end
end
