# frozen_string_literal: true

class Link::Operation::Destroy < Operation::Base
  def perform!(user:, params:, **)
    link = Link.find_by(short_link: params[:link][:short_link])
    UserLink.find_by(user:, link:).destroy!

    # TODO: think how to do it automatically through activerecord
    return unless UserLink.find_by(link:).nil?

    link.destroy!
    
  end
end
