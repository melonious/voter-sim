require "./person_sim.rb"
require "./ps_and_vs_sim.rb"
require "./world_sim.rb"



module VoterRegistration

  def self.main_menu
    puts
    puts "-" * 80
    puts
    puts "Welcome to the main menu."
    puts "Would you like to:"
    puts "(C)reate, (L)ist, (U)pdate, or (D)elete"
    puts
    user_action = gets.chomp.downcase
    if user_action == "c" || user_action == "create"
      create_sim
    elsif user_action == "l" || user_action == "list"
      list_sims
    elsif user_action == "u" || user_action == "update"
      update_sim
    elsif user_action == "d" || user_action == "delete"
      delete_sim
    else
      puts
      puts "That wasn't an option."
      puts "Let's try that again."
      main_menu
    end
  end

  def self.create_voter
    puts
    puts "What is your voter's name?"
    name = gets.chomp
    puts
    puts "What is your voter's political affiliation?"
    puts "Options: Liberal, Conservative, Tea Party, Socialist, or Neutral"
    affiliation = gets.chomp
    @earth.voters << Voter.new(name, affiliation)
    main_menu
  end

  def self.create_politician
    puts
    puts "What is your politician's name?"
    name = gets.chomp
    puts
    puts "What is your politician's political party?"
    puts "Options: Democrat, Republican"
    party = gets.chomp
    @earth.politicians << Politician.new(name, party)
    main_menu
  end

  def self.create_sim
    puts
    puts "Do you want to create a Voter or a Politician?"
    type_sim = gets.chomp.downcase
    if type_sim == "voter" || type_sim == "v"
      create_voter
    elsif type_sim == "politician" || type_sim == "p"
      create_politician
    else
      puts
      puts "That wasn't an option."
      puts "Let's try that again."
      main_menu
    end
  end

  def self.list_sims
    if @earth.voters == []
      puts
      puts "You don't have any voters yet!"
    else
      puts
      puts "Your voters are:"
      @earth.voters.each do |voter|
        puts voter.name.to_s + " - " + voter.affiliation.to_s
      end
    end

    if @earth.politicians == []
      puts
      puts "You don't have any politicians yet!"
    else
      puts
      puts "Your politicians are:"
      @earth.politicians.each do |polit|
        puts polit.name.to_s + " - " + polit.party.to_s
      end
    end
    main_menu
  end

  # def self.list_voters
  #   if @earth.voters == []
  #     puts
  #     puts "You don't have any voters yet!"
  #   else
  #     puts
  #     puts "Your voters are:"
  #     @earth.voters.each do |voter|
  #       puts voter.name.to_s + " - " + voter.affiliation.to_s
  #     end
  #   end
  # end
  #
  # def self.list_politicians
  #   if @earth.politicians == []
  #     puts
  #     puts "You don't have any politicians yet!"
  #   else
  #     puts
  #     puts "Your politicians are:"
  #     @earth.politicians.each do |polit|
  #       puts polit.name.to_s + " - " + polit.party.to_s
  #     end
  #   end
  # end

  def self.update_voter
    puts
    puts "Which voter do you want to update?"
    voter_change = gets.chomp
    @earth.voters.each do |voter|
      if voter.name == voter_change
        puts
        puts "What should their name be?"
        new_name = gets.chomp
        puts
        puts "What is their political affiliation?"
        puts "Options: Liberal, Conservative, Tea Party, Socialist, or Neutral"
        new_affil = gets.chomp
        voter.name = new_name
        voter.affiliation = new_affil
      else
        puts
        puts "Oops, they're not in our list."
      end
      main_menu
    end
  end

  def self.update_politician
    puts
    puts "Which politician do you want to update?"
    polit_change = gets.chomp
    @earth.politicians.each do |polit|
      if polit.name == polit_change
        puts
        puts "What should their name be?"
        new_name = gets.chomp
        puts
        puts "What is their political party?"
        puts "Options: Democrat, Republican"
        new_affil = gets.chomp
        polit.name = new_name
        polit.affiliation = new_affil
      else
        puts
        puts "Oops, they're not in our list."
      end
      main_menu
    end
  end


  def self.update_sim
    puts
    puts "Do you want to update a voter or a politician?"
    update = gets.chomp.downcase
    if update == "v" || update == "voter"
      update_voter
    elsif update == "p" || update == "politician"
      update_politician
    else
      puts
      puts "That wasn't an option."
      puts "Let's try that again."
      main_menu
    end
  end

  def self.delete_voter
    puts
    puts "Which voter do you want to delete"
    # if @earth.voters == []
    #   puts
    #   puts "You don't have any voters yet!"
    # else
    #   puts
    #   puts "Your voters are:"
    #   @earth.voters.each do |voter|
    #     puts voter.name.to_s + " - " + voter.affiliation.to_s
    #   end
    # end
    voter_delete = gets.chomp.downcase.capitalize
    size = @earth.voters.size
    @earth.voters.delete_if {|voter| voter.name == voter_delete}
    # this checks if anything was actually deleted
    if size == @earth.voters.size
      puts
      puts "Did you mean to create a new voter?"
    end
    main_menu
  end

  def self.delete_politician
    puts
    puts "Which politician do you want to delete?"
    politician_delete = gets.chomp
    size = @earth.voters.size
    @earth.politicians.delete_if {|politician| politician.name == politician_delete}
    if size == @earth.politicians.size
      puts
      puts "Did you mean to create a new voter?"
    end
    main_menu
  end

  def self.delete_sim
    puts
    puts "Do you want to delete a voter or a politician?"
    delete = gets.chomp
    if delete == "v" || delete == "voter"
      delete_voter
    elsif delete == "p" || delete == "politician"
      delete_politician
    else
      puts
      puts "That wasn't an option."
      puts "Let's try that again."
      main_menu
    end
  end

  def self.game_start
    @earth = World.new
    main_menu
  end
end

VoterRegistration.game_start
