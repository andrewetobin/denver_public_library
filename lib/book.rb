class Book
  attr_reader   :author_first_name,
                :author_last_name,
                :title
  attr_accessor :publication_date

  def initialize args
    args.each do |k,v|
      instance_variable_set("@#{k}", v) unless v.nil?
    end
    @publication_date = publication_date[-4..-1]
    @author_first_name
    @author_last_name
    @title
  end
end
