# Voters and Politicians are both People with names.
# Politicians have a party affiliation either Democrat or Republican.
require "./person_sim.rb"

class Politician < Person
  attr_accessor :party

  def initialize(name, party)
    super(name)
    @party = party
  end

end
# Voters and Politicians are both People with names.
# Voters have a political affliliation of either
# Liberal, Conservative, Tea Party, Socialist, or Neutral

class Voter < Person
  attr_accessor :affiliation

  def initialize(name, affiliation)
    super(name)
    @affiliation = affiliation
  end

end

# test:
# voter = Voter.new("Melin", "Liberal")
# puts voter.name
# politician = Politician.new("Bernie", "Liberal as Fuck")
# puts politician.name
