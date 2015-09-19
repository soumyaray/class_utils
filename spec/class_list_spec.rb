require 'minitest/autorun'
require 'minitest/rg'
require './spec/spec_helper.rb'

describe 'ClassList', 'List of students' do

  before do
    @roster = ClassList.new(LIST916)
  end

  it 'should find all items' do
    @roster.list.count == 33
  end

  it 'should only contain valid emails' do
    @roster.list.map { |email| email =~ /@/ }.
      reduce { |index1, index2| index1 && index2 }.wont_be_nil
  end
end
