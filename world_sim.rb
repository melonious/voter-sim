# You are going to build a program that allows a user to create a directory of politicians and voters.
# Users will be able to Create, List, Update and Delete both voters and politicians from the directory.
#
# Voters and Politicians are both People with names. Voters however,
# have a political affliliation of either Liberal, Conservative, Tea Party, Socialist, or Neutral,
# while politicians have a party affiliation either Democrat or Republican.
#
# Once the program starts, you should be greeted with a “main menu” that allows you to perform all
# the CRUD actions on either voter or politicians: (C )reate, (L)ist, (U)pdate, (D)elete.

# REAL PROMPT:
#election should contain a world and add politicians and voters to it
# a politician or a voter should not add itself to world when it is created
# the election module should do that
# Once the program starts, you should be greated with a “main menu” that allows you to perform all
# the CRUD actions on either voter or politicians: (C )reate, (L)ist, (U)pdate, (D)elete.



require "./person_sim.rb"
require "./ps_and_vs_sim.rb"

class World
  attr_accessor :voters, :politicians

  def initialize
    @voters = []
    @politicians = []
  end

end
