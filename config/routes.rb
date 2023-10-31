# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users,
             path: 'auth',
             path_names: {
               sign_in: 'login',
               sign_out: 'logout',
               password: 'secret',
               confirmation: 'verification',
               unlock: 'unblock',
               registration: 'register',
               sign_up: 'signup'
             },
             controllers: { registrations: 'registrations' }

  resource :link, only: %i[create destroy index]

  get '/:short_link', to: 'links#redirect', as: :custom_route

  root 'links#index'
end
