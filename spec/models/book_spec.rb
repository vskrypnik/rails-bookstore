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
    it { is_expected.to have_many(:order_items) }
  end

  describe '#newest' do
    it 'returns ordered by created_at:desc' do
      books = create_list(:book, 5)

      expect(Book.newest).to eq(books.reverse)
    end
  end

  describe '#bestsellers' do
    it 'returns ordered by order items count' do
      bestsellers_books = Array.new(3) do |order_items_count|
        create(:book_with_order_items, order_items_count: order_items_count)
      end

      expect(Book.bestsellers).to eq(
        bestsellers_books.reverse
      )
    end
  end
end
