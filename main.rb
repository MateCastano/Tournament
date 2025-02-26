require_relative 'models/player.rb'
require_relative 'models/team.rb'

team1 = Team.new("Lakers")

player1 = Player.new("Mateo", "Lakers", "Base")
player2 = Player.new("Carlos", "Lakers", "Escolta")

team1.print_all_info

player1.print_all_info
player2.print_all_info