# frozen_string_literal: true

RSpec.describe Book, type: :model do
  describe 'columns' do
    it { is_expected.to have_db_column(:name).of_type(:string).with_options(null: false, index: true) }
    it { is_expected.to have_db_column(:description).of_type(:string).with_options(null: false) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:description) }
  end

  describe 'associations' do
    it { is_expected.to have_and_belong_to_many(:authors) }
  end
end
