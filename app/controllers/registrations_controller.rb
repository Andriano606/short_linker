# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController
  def create
    super do |resource|
      flash[:notice] = I18n.t('devise.registrations.signed_up') if resource.persisted?
    end
  end
end
