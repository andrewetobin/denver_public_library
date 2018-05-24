class Author
  attr_reader    :first_name,
                 :last_name
   attr_accessor :books


  def initialize args
    args.each do |k,v|
      instance_variable_set("@#{k}", v) unless v.nil?
    end
    @books = []
  end

  def add_book(title, pub_date)
    @books <<

  end


end
