# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LinksController, type: :controller do
  include RSpec::Benchmark::Matchers

  describe 'GET #redirect' do
    let!(:link) { FactoryBot.create(:link) }

    it 'redirects to the target URL' do
      get :redirect, params: { short_link: link.short_link }
      expect(response).to redirect_to(link.full_link)
    end
  end
end
