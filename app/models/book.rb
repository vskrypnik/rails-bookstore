# frozen_string_literal: true

class Book < ApplicationRecord
  scope :newest, -> { order(created_at: :desc) }

  scope :bestsellers, lambda {
    left_joins(:order_items)
      .group('books.id')
      .order('count(order_items.id) desc')
  }

  validates :name, presence: true
  validates :description, presence: true

  has_many :order_items

  has_and_belongs_to_many :authors
end
