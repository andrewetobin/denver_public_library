require './test/test_helper'
require './lib/author'
require './lib/book'

class AuthorTest < Minitest::Test

  def test_it_exists
    book = Author.new({first_name: "Charlotte", last_name: "Bronte"})

    assert_instance_of Author, book
  end

  def test_it_starts_with_no_books
    author = Author.new({first_name: "Charlotte", last_name: "Bronte"})

    assert_equal [], author.books
  end

  def test_add_book
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})

    charlotte_bronte.add_book("Jane Eyre", "October 16, 1847")

    assert_instance_of Book, charlotte_bronte.books[0]

    charlotte_bronte.add_book("Villette", "1853")

    assert_equal 2, charlotte_bronte.books.length
  end


end
