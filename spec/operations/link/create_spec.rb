# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Link::Operation::Create, type: :operation do
  before(:each) do
    described_class.call(**arg)
  end

  let(:user) { FactoryBot.create(:user) }
  let(:full_link) { Faker::String.random }

  let(:arg) do
    {
      user:,
      params: {
        link: { full_link: }
      }
    }
  end

  context 'when create a link' do
    it 'succeeded' do
      expect(Link.count).to eq(1)
    end
  end
end
