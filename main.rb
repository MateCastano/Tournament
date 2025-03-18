require_relative 'models/player.rb'
require_relative 'models/team.rb'
require_relative 'models/tournament.rb'

tournament1 = Tournament.new("NBA") 
tournament1.set_format(1)

team1 = Team.new("Lakers", 10)
team2 = Team.new("Celtics", 3)
team3 = Team.new("Bulls", 4)
team4 = Team.new("Knicks", 12)
team5 = Team.new("Warriors", 9)
team6 = Team.new("Sixers", 0)
team7 = Team.new("Thunder", 7)
team8 = Team.new("Heat", 11)

tournament1.save_team(team1)
tournament1.save_team(team2)
tournament1.save_team(team3)
tournament1.save_team(team4)
tournament1.save_team(team5)
tournament1.save_team(team6)
tournament1.save_team(team7)
tournament1.save_team(team8)

player1 = Player.new("Lebron James", "Lakers", "Alero")
player2 = Player.new("Luka Doncic", "Lakers", "Base")

team1.save_player(player1)
team1.save_player(player2)

tournament1.generate_fixture
tournament1.show_fixture

#tournament1.save_result("Lakers", "Celtics", 103, 101)
#tournament1.save_result("Knicks", "Heat", 120, 91)
#tournament1.save_result("Thunder", "Sixerss", 100, 131)
#tournament1.show_results
puts "-----"
tournament1.generate_table