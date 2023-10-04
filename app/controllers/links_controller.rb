class LinksController < ApplicationController

  def index
  end

  def redirect
    begin
      redirect_to Link.find(params[:short_link]).full_link, allow_other_host: true
    rescue
      raise ActionController::RoutingError.new('Not Found')
      # render :status => 404 # TODO: implement this page in future
    end
  end
end
