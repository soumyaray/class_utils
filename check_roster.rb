class ClassList
  attr_reader :list

  def initialize(list)
    @list = split_into_lines(list)
  end

  private

  def split_into_lines(list)
    list.split("\n")
  end
end

class ListComparison
  def initialize(list1, list2)
    @list1 = list1
    @list2 = list2
  end

  def compare
    puts "Newly joined: #{@list2.list - @list1.list}"
    puts "Dropped out: #{@list1.list - @list2.list}"
  end
end
