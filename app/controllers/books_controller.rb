class BooksController < ApplicationController
  BOOKS = [
    { title: "The Hobbit", author: "J. R. R. Tolkien", price: 12.5, copies: 3 },
    { title: "Dune", author: "Frank Herbert", price: 14.0, copies: 1 },
    { title: "Kindred", author: "Octavia E. Butler", price: 11.25, copies: 0 }
  ].freeze

  def index
    @books = BOOKS
  end
end
