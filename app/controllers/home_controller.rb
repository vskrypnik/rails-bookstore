# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @newest_books      = Book.newest.limit(3)
    @bestsellers_books = Book.bestsellers.limit(4)
  end
end
