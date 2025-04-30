require 'json'
require_relative '../models/player.rb'
require_relative '../models/team.rb'
require_relative '../models/tournament.rb'
require_relative '../utils/storage_management.rb'

#Guardar nuevo torneo.
def storage_new_tournament(tournament_data)
    Dir.mkdir("data") unless Dir.exist?("data")

    File.open("data/#{@name.downcase.gsub(" ", "_")}.txt", "w") do |file|
        file.puts JSON.pretty_generate(tournament_data)
    end
end

#Guardar nuevo equipo.
def storage_new_team(teams_data, tournament_name)
    Dir.mkdir("data") unless Dir.exist?("data")
  
    file_path = "data/#{tournament_name.downcase.strip}.txt"
    
    if File.exist?(file_path)
      tournament_data = JSON.parse(File.read(file_path), symbolize_names: true)
      tournament_data[:teams] = teams_data.map { |team| { name: team.name, players: team.players ,points: team.points} }
  
      File.write(file_path, JSON.pretty_generate(tournament_data))
    else
      puts "No se encontró el torneo '#{tournament_name}'."
    end
  end
  