require './test/test_helper'
require './lib/book'
require './lib/library'
require './lib/author'

class LibraryTest < Minitest::Test
  def test_it_exists
    dpl = Library.new

    assert_instance_of Library, dpl
  end

  def test_it_starts_with_no_books
    dpl = Library.new

    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.add_book("Jane Eyre", "October 16, 1847")
    villette  = charlotte_bronte.add_book("Villette", "1853")

    harper_lee  = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.add_book("To Kill a Mockingbird", "July 11, 1960")

    assert_equal [], dpl.books
  end

  def test_add_books
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.add_book("Jane Eyre", "October 16, 1847")
    villette  = charlotte_bronte.add_book("Villette", "1853")

    harper_lee  = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.add_book("To Kill a Mockingbird", "July 11, 1960")

    dpl = Library.new

    dpl.add_to_collection(jane_eyre)

    assert_equal 1, dpl.books.length
    assert_instance_of Book, dpl.books[0]

    dpl.add_to_collection(mockingbird)
    dpl.add_to_collection(villette)

    assert_equal 3, dpl.books.length
  end


  def test_include?
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.add_book("Jane Eyre", "October 16, 1847")
    villette  = charlotte_bronte.add_book("Villette", "1853")

    harper_lee  = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.add_book("To Kill a Mockingbird", "July 11, 1960")

    dpl = Library.new

    dpl.add_to_collection(jane_eyre)
    dpl.add_to_collection(mockingbird)
    dpl.add_to_collection(villette)

    assert_equal true, dpl.include?("To Kill a Mockingbird")


    assert_equal false, dpl.include?("A Connecticut Yankee in King Arthur's Court")

  end

  def test_card_catalogue
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.add_book("Jane Eyre", "October 16, 1847")
    villette  = charlotte_bronte.add_book("Villette", "1853")

    harper_lee  = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.add_book("To Kill a Mockingbird", "July 11, 1960")

    dpl = Library.new

    dpl.add_to_collection(jane_eyre)
    dpl.add_to_collection(mockingbird)
    dpl.add_to_collection(villette)

    assert_equal "Bronte", dpl.card_catalogue[0].author_last_name
    assert_equal "Bronte", dpl.card_catalogue[1].author_last_name
    assert_equal "Lee", dpl.card_catalogue[2].author_last_name
  end
end
