# frozen_string_literal: true

RSpec.describe OrderItem, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:book) }
  end
end
