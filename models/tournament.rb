require "json"
class Tournament
    def initialize(name)
        @name = name
        @teams = []
        @results = []
    end

    attr_accessor :name, :teams, :results

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
    end

    #Genera el fixture del torneo con los equipos disponibles
    def generate_fixture
        
        if @teams.length.odd?
            @teams << Team.new("Libre")
        end 

        File.open("data/fixture.txt", "w") do |file|
            
        end

        if File.read("data/fixture.txt").strip.empty?
            puts "No se ha generado un fixture aun."
        else
            File.open("data/fixture.txt", "r") do |file|
            puts file.read
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