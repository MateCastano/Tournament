class Tournament
    def initialize(name)
        @name = name
        @teams = []
        @format
    end

    attr_accessor :name, :teams, :format

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
        File.open("data/fixture.txt", "w") { |file| file.truncate(0) }
        puts "Fixture generado"
        
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
end