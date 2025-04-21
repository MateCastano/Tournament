require "json"
require_relative '../utils/storage_management.rb'

class Tournament
    attr_accessor :name, :teams, :results
    def initialize(name)
        @name = name
        @teams = []
        @results = []
        
        tournament_data = {
            name: @name,
            teams: @teams,
            results: @results
        }

        storage_new_tournament(tournament_data)
    end

    #Methods
    #Muestra toda la info del torneo
    def print_all_info
        puts @name
        puts @format
    end

    #Muestra toda la info por equipo
    def print_info_by_team
        if @teams.empty?
            puts "No existen jugadores registrados en este equipo."
        else
            puts "Equipos"    
            @teams.each do |team|
                next if team.name == "Libre"
        
                team.print_all_info
            end
        end
    end

    #Registra los equipos en el torneo
    def save_team(team)
        if team.name.strip.empty?
            puts "Ingrese un equipo valido."
            return
        end

        @teams << team

        storage_new_team(@teams, @name)
    end

    #Genera el fixture del torneo con los equipos disponibles
    def generate_fixture
        teams_shuffled = @teams.shuffle
        
        if teams_shuffled.length.odd?
            teams_shuffled << Team.new("Libre")
        end 
        
        fixture = []

        (0...teams_shuffled.length - 1).each do |round|
            matchups = []
            
            (0...(teams_shuffled.length / 2)).each do |i|
                team_a = teams_shuffled[i]
                team_b = teams_shuffled[teams_shuffled.length - 1 - i]
              
                matchups << [team_a, team_b]
            end
          
            fixture << matchups
            teams.insert(1, teams.pop)
        end

        File.open("data/fixture.txt", "w") do |file|
            fixture.each_with_index do |round, index|
                file.puts "Fecha #{index + 1}:"
                round.each { |match| file.puts "#{match[0].name} vs #{match[1].name}" }
                file.puts "-" * 20
            end
        end      
        
    end

    #Muestra el fixture
    def show_fixture    
        if File.read("data/fixture.txt").strip.empty?
            puts "No se ha generado un fixture aun."
        else
            File.open("data/fixture.txt", "r") do |file|
                puts file.read
            end
        end
    end

    #Guarda resultado
    def save_result(team_a, team_b, points_team_a, points_team_b)
        result = [{"local" => team_a, 
                "visitante" => team_b, 
                "puntos_local" => points_team_a,
                "puntos_visitante" => points_team_b}]

        if points_team_a > points_team_b
            winner_team = team_a    
        else
            winner_team = team_b
        end
        
        @teams.each do |team|
            if team.name == winner_team
                team.points = team.points + 3
            end
        end
        
        File.open("data/results.txt", "a") do |file|
        file.puts result.to_json
        end
    end

    #Mostrar resultados
    def show_results
        if File.read("data/results.txt").strip.empty?
            puts "No se ha guardado resultados."
        else
            File.open("data/results.txt", "r") do |file|
            puts file.read
            end
        end 
    end

    #Generar tabla de puntuacion
    def generate_table
        puts "Tabla de puntajes."
        File.open("data/table-bracket.txt", "w") do |file|
            soarted_teams = @teams.sort_by {|team| team.points}.reverse
            soarted_teams.each do |team|
                next if team.name == "Libre"
                
                file.puts "#{team.name} #{team.points} pts."
            end
        end
        File.open("data/table-bracket.txt", "r") do |file|
            puts file.read
        end
    end
end