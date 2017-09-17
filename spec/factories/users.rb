# frozen_string_literal: true

FactoryGirl.define do
  factory :user do
    email    { Faker::Internet.email }
    password 'password'

    factory :confirmed_user do
      confirmed_at { Time.now }
    end
  end
end
