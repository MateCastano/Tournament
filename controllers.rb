require_relative 'models/player.rb'
require_relative 'models/team.rb'
require_relative 'models/tournament.rb'

#Crear torneo
def new_tournament(name)
    if tournament = Tournament.new(name)
        return true
    else
        return false
    end
end

#Crear equipo
=begin
def new_team(name)
    team = Team.new(name)

    if   
        return true
    else
        return false
    end
end
=end