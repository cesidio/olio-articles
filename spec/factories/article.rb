# frozen_string_literal: true

FactoryBot.define do
  factory :article do
    external_id { rand(100_000..999_999) }
    title { Faker::Food.dish }
    description { Faker::Food.description }
    remote_likes { rand(100) }
    local_likes { rand(100) }
  end
end
