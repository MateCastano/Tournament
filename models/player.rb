class Player
    def initialize(name, team, position)
        @name = name
        @team = team
        @position = position
    end

    attr_accessor :name, :team, :position

    #Methods
    def print_all_info
        puts "Nombre: #{@name} || Equipo: #{@team} || Posicion: #{@position}"
    end
end 

