class Tournament
    def initialize(name)
        @name = name
        @teams = []
    end

    attr_accessor :name, :teams

    #Methods
    def print_all_info
        puts @name
    end
end