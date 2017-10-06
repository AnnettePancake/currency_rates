# frozen_string_literal: true

FactoryGirl.define do
  factory :rate do
    trait :usd do
      currency 'USD'
    end

    trait :eur do
      currency 'EUR'
    end
  end
end
