# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { 'gennady' }
    email { 'ggg@g.com' }
    password { 'abcdefghi' }
    password_confirmation { 'abcdefghi' }
    id { 1 }
  end
end
