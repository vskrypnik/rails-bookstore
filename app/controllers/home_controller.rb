# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @books = Book.newest.limit(3)
  end
end
