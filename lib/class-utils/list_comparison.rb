dir = File.expand_path(File.dirname(__FILE__))
require "#{dir}/class_list"

class ListComparison
  def initialize(list1, list2)
    @list1 = list1
    @list2 = list2
  end

  def compare
    { joined: @list2.list - @list1.list,
      dropped: @list1.list - @list2.list }
  end
end
