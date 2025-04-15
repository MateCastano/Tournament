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
def new_team(name)
    if team = Team.new(name)
        return true
    else
        return false
    end
end