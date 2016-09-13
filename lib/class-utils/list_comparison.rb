dir = File.expand_path(File.dirname(__FILE__))
require "#{dir}/class_list"

class ListComparison
  def initialize(class1, class2)
    @class1 = class1
    @class2 = class2
  end

  def compare
    { joined: @class2.students - @class1.students,
      dropped: @class1.students - @class2.students }
  end
end
