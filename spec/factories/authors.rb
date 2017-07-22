# frozen_string_literal: true

FactoryGirl.define do
  factory :author do
    first_name  { Faker::Name.first_name }
    last_name   { Faker::Name.last_name }
    description { Faker::Lorem.sentence }

    factory :author_with_books do
      transient do
        books_count 2
      end

      after(:create) do |author, evaluator|
        create_list(:book, evaluator.books_count, authors: [author])
      end
    end
  end
end
