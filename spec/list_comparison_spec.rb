require './spec/spec_helper.rb'

describe 'ListComparison', 'Service to compare lists' do
  before do
    roster1 = ClassList.new('spec/test_cases/STU_LIST0916.csv')
    roster2 = ClassList.new('spec/test_cases/STU_LIST0917.csv')
    @rosters = ListComparison.new(roster1, roster2)
  end

  it 'should find new students' do
    emails_join = @rosters.compare[:joined].map { |student| student[:email] }
    emails_join.must_equal ['angela.hung@iss.nthu.edu.tw']
  end

  it 'should find dropped students' do
    emails_drop = @rosters.compare[:dropped].map { |s| s[:email] }
    emails_drop.must_equal ['loveangela31@gmail.com', 'clairecc@hotmail.com.tw']
  end
end
