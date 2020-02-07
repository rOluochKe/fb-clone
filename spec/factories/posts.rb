# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    title { 'Need Jap' }
    content { 'I want to learn ROR, any native speakers around?? Please' }
    user_id { 1 }
    id { 1 }
  end
end
