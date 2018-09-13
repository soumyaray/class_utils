require "#{__dir__}/roster"

# Compares student lists between two Rosters
class CompareRosters
  def initialize(old_roster, new_roster)
    @old_roster = old_roster
    @new_roster = new_roster
  end

  def call
    joined_ids = @new_roster.ids - @old_roster.ids
    dropped_ids = @old_roster.ids - @new_roster.ids

    { joined: @new_roster.students_with_ids(joined_ids),
      dropped: @old_roster.students_with_ids(dropped_ids) }
  end
end
