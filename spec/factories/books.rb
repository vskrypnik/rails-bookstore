# frozen_string_literal: true

FactoryGirl.define do
  factory :book do
    name        { Faker::Book.title }
    description { Faker::Lorem.sentence }

    factory :book_with_authors do
      transient do
        authors_count 3
      end

      after(:create) do |book, evaluator|
        create_list(:author, evaluator.authors_count, books: [book])
      end
    end

    factory :book_with_order_items do
      transient do
        order_items_count 3
      end

      after(:create) do |book, evaluator|
        create_list(:order_item, evaluator.order_items_count, book: book)
      end
    end
  end
end
