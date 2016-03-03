require './spec/spec_helper.rb'

describe 'ListComparison', 'Service to compare lists' do

  before do
    roster1 = ClassList.new(LIST916)
    roster2 = ClassList.new(LIST917)
    @rosters = ListComparison.new(roster1, roster2)
  end

  it 'should find new students' do
    @rosters.compare[:joined].must_equal ["angela.hung@iss.nthu.edu.tw"]
  end

  it 'should find dropped students' do
    @rosters.compare[:dropped].must_equal ["loveangela31@gmail.com", "clairecc@hotmail.com.tw"]
  end
end
