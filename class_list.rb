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
