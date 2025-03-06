class Tournament
    def initialize(name)
        @name = name
        @teams = []
        @format
    end

    attr_accessor :name, :teams, :format

    #Methods
    def print_all_info
        puts @name
        puts @format
    end

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

    def save_team(team)
        if team.name.strip.empty?
            puts "Ingrese un equipo valido."
            return
        end

        @teams << team
    end

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

    def fixture()
        puts "Fixture"
        i = 0
        teams_selected = []
        flag = 0
        
        while i < @teams.length
            select = @teams.sample
            teams_selected.each do |team|
                if team == select 
                    flag = 1
                end
            end
            if flag != 1
                teams_selected = select
                select.print_all_info
            end   
            i = i + 1
        end
    end
end