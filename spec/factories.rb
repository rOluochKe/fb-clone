# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { 'John Doe' }
    email { Faker::Internet.email }
    password { '1234567' }
    password_confirmation { '1234567' }
  end

  factory :post do
    user
    content { 'This is factory content of a post' }
  end
end
