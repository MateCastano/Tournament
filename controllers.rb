require_relative 'models/player.rb'
require_relative 'models/team.rb'
require_relative 'models/tournament.rb'

#Buscar torneo por nombre
def search_tournament_by_name(name) 
    file_path = "data/#{name.downcase.strip}.json"
    return nil unless File.exist?(file_path)
  
    file_data = JSON.parse(File.read(file_path), symbolize_names: true)
    [file_data, file_path]
end

#Crear torneo
def new_tournament(name)
    if tournament = Tournament.new(name)
        return true
    else
        return false
    end
end

#Crear equipo
def new_team(name, tournament_name)
    tournament_data, path = search_tournament_by_name(tournament_name)

  if tournament_data.nil?
    puts "Torneo no encontrado."
    return
  end

  if tournament_data[:teams].any? { |team| team[:name].downcase == team_name.downcase }
    puts "Ese equipo ya existe."
    return
  end

  team = Team.new(name)

  tournament = Tournament.allocate
  tournament.name = tournament_data[:name]
  tournament.teams = tournament_data[:teams].map { |t| Team.new(t[:name]) }
  tournament.results = tournament_data[:results] || []

  tournament.save_team(team)

  return true
end