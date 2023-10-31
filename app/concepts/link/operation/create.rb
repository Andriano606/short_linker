# frozen_string_literal: true

class Link::Operation::Create < Operation::Base
  def perform!(user:, params:, **)
    full_link = params[:link][:full_link]
    short_link = Link.generate_short_link(full_link)

    link = Link.find_by(short_link:)
    if link.nil?
      create_new_link_and_attach_to_user(user:, full_link:, short_link:)
    else
      attach_exists_link_to_user(user:, link:)
    end
  end

  private

  def create_new_link_and_attach_to_user(user:, full_link:, short_link:)
    self.model = Link.new(full_link:)
    model.short_link = short_link

    return unless model.save!

    user.links << model
    
  end

  def attach_exists_link_to_user(user:, link:)
    if user.links.include?(link)
      result[:errors] = I18n.t('link.create.error.user_already_has_this_link')
      raise ActiveRecord::RecordInvalid
    end

    user.links << link
  end
end
