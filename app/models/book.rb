# frozen_string_literal: true

class Book < ApplicationRecord
  scope :newest, -> { order(created_at: :desc) }

  validates :name, presence: true
  validates :description, presence: true

  has_and_belongs_to_many :authors
end
