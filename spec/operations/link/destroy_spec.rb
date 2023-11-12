# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Link::Operation::Destroy, type: :operation do
  before(:each) do
    link.users = users

    described_class.call(**arg)
  end

  let(:users) { [FactoryBot.create(:user)] }
  let(:full_link) { Faker::String.random }
  let(:link) { FactoryBot.create(:link, full_link:) }

  let(:arg) do
    {
      user: users.first,
      params: {
        link: { short_link: link.short_link }
      }
    }
  end

  context 'when destroy link' do
    it 'succeeded' do
      expect(Link.count).to eq(0)
      expect(users.first.links).not_to include(link)
    end
  end

  context 'when link belongs to two users' do
    let(:users) { [FactoryBot.create(:user), FactoryBot.create(:user)] }

    it 'delete it only for one user' do
      expect(Link.count).to eq(1)
      expect(users.first.links).not_to include(link)
      expect(users.second.links).to include(link)
    end
  end
end
