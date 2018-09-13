require './spec/spec_helper.rb'

describe 'RosterCompare', 'Service to compare lists' do
  before do
    roster1 = Roster.new('spec/test_cases/STU_LIST-0830.csv')
    roster2 = Roster.new('spec/test_cases/STU_LIST-0912.csv')
    @changes = CompareRosters.new(roster1, roster2)
  end

  it 'should find new students' do
    shoulda_joined = %w[104065423 105061601
                        105062558 106062602 106064515 106064548]
    joined_ids = @changes.joined.map { |student| student[:id] }
    joined_ids.must_equal shoulda_joined
  end

  it 'should find dropped students' do
    shoulda_dropped = %w[104042003 105077506
                         106061576 106078507 106078514 106078516]
    dropped_ids = @changes.dropped.map { |student| student[:id] }
    dropped_ids.must_equal shoulda_dropped
  end
end
