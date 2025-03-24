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
puts "----------"
tournament1.generate_fixture
tournament1.show_fixture

tournament1.save_result("Lakers", "Celtics", 100, 101)
tournament1.save_result("Celtics", "Heat", 120, 91)
tournament1.save_result("Thunder", "Sixers", 100, 131)
tournament1.save_result("Heat", "Sixers", 90, 110)
tournament1.save_result("Warriors", "Bulls", 100, 131)
tournament1.show_results
puts "----------"
tournament1.generate_table