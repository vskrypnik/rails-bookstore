# frozen_string_literal: true

class OrderItem < ApplicationRecord
  belongs_to :book

  validates :book, presence: true
end
