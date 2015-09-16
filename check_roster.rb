class ClassLists
  def initialize(list1, list2)
    @list1 = split_list(list1)
    @list2 = split_list(list2)
  end

  def split_list(list)
    list.split("\n")
  end

  def compare
    puts "Newly joined: #{@list2 - @list1}"
    puts "Dropped out: #{@list1 - @list2}"
  end
end
