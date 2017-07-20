# frozen_string_literal: true

FactoryGirl.define do
  factory :book do
    name { Faker::Book.title }
    description { Faker::Lorem.sentence }
  end
end
