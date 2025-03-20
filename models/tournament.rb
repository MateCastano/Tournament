require "json"
class Tournament
    def initialize(name)
        @name = name
        @teams = []
        @format
        @results = []
    end

    attr_accessor :name, :teams, :format, :results

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

    #Establece el formato del torneo
    def set_format(num)
        if !num
            puts "Ingrese un numero."
        end
        if num == 1
            @format = "Liga"
        elsif num == 2
            @format = "Eliminacion directa"
        end
    end
    
    #Genera el fixture del torneo con los equipos disponibles
    def generate_fixture
        shuffled_teams = @teams.shuffle
        matchups = []

        shuffled_teams.each_slice(2) do |pair|
            if pair.size == 2
                matchups << "#{pair[0].name} vs #{pair[1].name}"
            else
                matchups << "#{pair[0].name} queda libre esta fecha."
            end
        end

        File.open("data/fixture.txt", "w") do |file|
            matchups.each{|match| file.puts match}
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
                file.puts "#{team.name} #{team.points} pts."
            end
        end
        File.open("data/table-bracket.txt", "r") do |file|
            puts file.read
        end
    end
end