#!/usr/bin/env ruby

require_relative './lib/nthu_class_utils.rb'

if ARGV.count < 2
  puts "Usage:  check_roster [list1] [list2]\n"
  exit
end

list1 = Roster.new(ARGV[0])
list2 = Roster.new(ARGV[1])

changed = CompareRosters.new(list1, list2).call

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
