class Team
    def initialize(name, points)
        @name = name
        @players = []
        @points = points
    end

    attr_accessor :name, :players, :points

    #Methods
    def print_all_info
        puts "Nombre: #{@name}"
    end

    def print_info_by_team
        if @players.empty?
            puts "No existen jugadores registrados en este equipo."
        else
            puts "Jugadores"    
            @players.each do |player|
                player.print_all_info
            end
        end
    end

    def save_player(player)
        @players << player
    end

    def delete_player(player)
        if players.empty?
            puts "No existen jugadores registrados en este equipo."
        else   
            @players.delete(player)
        end
    end
end

