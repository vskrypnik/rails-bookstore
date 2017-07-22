# frozen_string_literal: true

RSpec.describe BooksHelper, type: :helper do
  describe '#authors_sentence' do
    it "returns string with authors' fullnames" do
      authors = [
        create(:author, first_name: 'Ned', last_name: 'Stark'),
        create(:author, first_name: 'John', last_name: 'Snow'),
        create(:author, first_name: 'Daenerys', last_name: 'Targaryen')
      ]

      book = create(:book, authors: authors)

      expect(authors_sentence(book)).to eq(
        'Ned Stark, John Snow, and Daenerys Targaryen'
      )
    end
  end
end
