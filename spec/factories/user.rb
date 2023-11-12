# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email do
      Faker::Internet.email
    end

    password do
      Faker::Internet.password
    end
  end
end
