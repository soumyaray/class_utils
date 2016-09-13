require './spec/spec_helper.rb'

describe 'ClassList', 'List of students' do

  before do
    @roster = ClassList.new('spec/test_cases/STU_LIST0916.csv')
  end

  it 'should find all items' do
    @roster.students.count == 33
  end

  it 'should only contain valid emails' do
    @roster.students.map { |s| s[:email] =~ /@/ }.
      reduce { |index1, index2| index1 && index2 }.wont_be_nil
  end
end
