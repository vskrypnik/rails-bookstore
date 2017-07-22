# frozen_string_literal: true

module BooksHelper
  def authors_sentence(book)
    book.authors.map(&:full_name).to_sentence
  end
end
