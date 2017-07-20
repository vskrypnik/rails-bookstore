# frozen_string_literal: true

class Book < ApplicationRecord
  scope :newest, -> { order(created_at: :desc) }

  validates :name, presence: true
  validates :description, presence: true
end
