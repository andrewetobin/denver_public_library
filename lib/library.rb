require './lib/book'
require './lib/author'

class Library
  attr_reader :books

  def initialize
    @books = []
  end

  def add_to_collection(title)
    @books << title
  end

  def include?(title)
    exists = @books.select do |book|
      book.title == title
    end
    return exists.length == 1
  end

  def card_catalogue
    @books.sort_by do |book|
      book.author_last_name
    end
  end

  def find_by_author(name)
    first_name = name.split(" ")[0]
    last_name = name.split(" ")[1]
    books.find_all do |book|
      book.author_first_name == first_name && book.author_last_name == last_name
    end
  end

  def find_by_publication_date(date)
    books.select do |book|
      book.publication_date == date
    end[0]
  end

  def test_find_by_author
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.add_book("Jane Eyre", "October 16, 1847")
    villette  = charlotte_bronte.add_book("Villette", "1853")

    harper_lee  = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.add_book("To Kill a Mockingbird", "July 11, 1960")

    dpl = Library.new

    dpl.add_to_collection(jane_eyre)
    dpl.add_to_collection(mockingbird)
    dpl.add_to_collection(villette)

    assert_equal 2, dpl.find_by_author("Charlotte Bronte").length
    assert_equal 1, dpl.find_by_author("Harper Lee").length
  end

  def test_find_by_pub_date
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.add_book("Jane Eyre", "October 16, 1847")
    villette  = charlotte_bronte.add_book("Villette", "1853")

    harper_lee  = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.add_book("To Kill a Mockingbird", "July 11, 1960")

    dpl = Library.new

    dpl.add_to_collection(jane_eyre)
    dpl.add_to_collection(mockingbird)
    dpl.add_to_collection(villette)

    assert_equal mockingbird, dpl.find_by_publication_date("July 11, 1960")
  end
end
