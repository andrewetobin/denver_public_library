require './test/test_helper'
require './lib/author'
require './lib/book'

class AuthorTest < Minitest::Test

  def test_author_has_books
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})

    assert_equal [], charlotte_bronte.books
  end

  def test_it_can_add_a_book
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    book = Book.new({author_first_name: "Charlotte", author_last_name: "Bronte", title: "Jane Eyre", publication_date: "October 16, 1847"})

    assert_equal "Charlotte", book.author_first_name
    assert_equal "Bronte", book.author_last_name
    assert_equal "1847", book.publication_date
    assert_equal "Jane Eyre", book.title
  end


end
