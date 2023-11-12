# frozen_string_literal: true

FactoryBot.define do
  factory :subscription do
    user { nil }
    description { 'MyText' }
    name { 'MyString' }
    expiration_date { '2023-10-07' }
  end
end
