# frozen_string_literal: true

class Author < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :description, presence: true

  has_and_belongs_to_many :books

  def full_name
    "#{first_name} #{last_name}"
  end
end
