#!/usr/bin/env ruby

require_relative './lib/class-utils.rb'

if ARGV.count < 2
  puts "Usage:  check_roster [list1] [list2]\n"
  exit
end

list1 = ClassList.new(ARGV[0])
list2 = ClassList.new(ARGV[1])

changed = ListComparison.new(list1, list2).compare

def puts_student(student)
  print '  '
  print "#{student[:id]} #{student[:name_zh]}"
  print "(#{student[:name_en]}) " unless student[:name_en].empty?
  print "\t<#{student[:email]}> #{student[:dept_zh]}\n"
end

if changed[:joined].count > 0
  puts 'NEWLY JOINED:'
  changed[:joined].each { |student| puts_student(student) }
end

if changed[:dropped].count > 0
  puts 'DROPPED OUT:'
  changed[:dropped].each { |student| puts_student(student) }
end

puts
