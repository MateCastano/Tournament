require 'json'
require_relative 'models/player.rb'
require_relative 'models/team.rb'
require_relative 'models/tournament.rb'

def storage_new_tournament(tournament_data)
    Dir.mkdir("data") unless Dir.exist?("data")

    File.open("data/#{@name.downcase.gsub(" ", "_")}.txt", "w") do |file|
        file.puts JSON.pretty_generate(tournament_data)
    end
end