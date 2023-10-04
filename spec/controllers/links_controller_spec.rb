# frozen_string_literal: true

require 'rails_helper'

include RSpec::Benchmark::Matchers

RSpec.describe LinksController, type: :controller do
  describe 'GET #redirect' do
    let!(:link) { FactoryBot.create(:link) }

    it 'redirects to the target URL' do
      get :redirect, params: { short_link: link.short_link }
      expect(response).to redirect_to(link.full_link)
    end
  end

  describe 'Performance testing' do
    context 'when 200 requests at one time' do
      let(:links) do
        FactoryBot.create_list(:link, 3)
        Link.all
      end

      let!(:threads) do
        Thread.new do
          get :redirect, params: { short_link: link.short_link }
          expect(response).to redirect_to(link.full_link)
        end
      end

      it 'redirects to the target URL' do
        threads.each(&:join)
      end
    end
  end
end
