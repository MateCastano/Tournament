class Team
    def initialize(name)
        @name = name
    end

    attr_accessor :name

    #Methods
    def print_all_info
        puts "Nombre: #{@name}"
        puts "-----------------"
    end
end 

