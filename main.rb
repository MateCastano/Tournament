require_relative 'models/player.rb'
require_relative 'models/team.rb'
require_relative 'models/tournament.rb'

tournament1 = Tournament.new("NBA") 
tournament1.print_all_info

team1 = Team.new("Lakers")
team1.print_all_info

player1 = Player.new("Lebron James", "Lakers", "Alero")
player2 = Player.new("Luka Doncic", "Lakers", "Base")

team1.save_player(player1)
team1.save_player(player2)
team1.print_info_by_team
team1.delete_player(player2)
team1.print_info_by_team


