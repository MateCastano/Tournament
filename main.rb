require_relative 'models/player.rb'
require_relative 'models/team.rb'
require_relative 'models/tournament.rb'

tournament1 = Tournament.new("NBA") 

team1 = Team.new("Lakers")
team2 = Team.new("Celtics")
team3 = Team.new("Bulls")
team4 = Team.new("Knicks")
team5 = Team.new("Warriors")
team6 = Team.new("Sixers")
team7 = Team.new("Thunder")
team8 = Team.new("Heat")
team9 = Team.new("Magic")
team10 = Team.new("Pacers")

tournament1.save_team(team1)
tournament1.save_team(team2)
tournament1.save_team(team3)
tournament1.save_team(team4)
tournament1.save_team(team5)
tournament1.save_team(team6)
tournament1.save_team(team7)
tournament1.save_team(team8)
tournament1.save_team(team9)
tournament1.save_team(team10)
 
tournament1.print_info_by_team

puts "----------"
tournament1.generate_fixture

puts "----------"
tournament1.generate_table