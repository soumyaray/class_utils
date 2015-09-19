dir = File.expand_path(File.dirname(__FILE__))

require "#{dir}/list_comparison"

 if ARGV.count < 2
   puts "Usage:  check_roster [list1] [list2]\n"
   exit
 end

def parse_roster_file(filename)
  file = File.read(filename, encoding: 'GBK')
  file.split("\n").map { |line| line.split(',').last}[1..-1].join("\n")
end

emails1 = parse_roster_file(ARGV[0])
emails2 = parse_roster_file(ARGV[1])

list1 = ClassList.new(emails1)
list2 = ClassList.new(emails2)

change = ListComparison.new(list1, list2).compare

puts "Newly joined: #{change[:joined]}"
puts "Dropped out : #{change[:dropped]}"
puts
