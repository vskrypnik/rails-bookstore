# frozen_string_literal: true

RSpec.describe Author, type: :model do
  describe 'columns' do
    it { is_expected.to have_db_column(:first_name).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:last_name).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:description).of_type(:string).with_options(null: false) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_presence_of(:description) }
  end

  describe 'associations' do
    it { is_expected.to have_and_belong_to_many(:books) }
  end

  describe '#full_name' do
    it "returns author's full name" do
      author = Author.new(
        first_name: 'First',
        last_name:  'Last'
      )

      expect(author.full_name).to eq('First Last')
    end
  end
end
