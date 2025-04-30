require_relative 'models/player.rb'
require_relative 'models/team.rb'
require_relative 'models/tournament.rb'
require_relative 'controllers.rb'
require_relative 'utils/storage_management.rb'

puts "¡ Bienvenidos al sistema !"
puts "1- Crear un nuevo torneo."
puts "2- Agregar un nuevo equipo."
puts "3- Ingresar un nuevo jugador."
puts "4- Generar fixture."
puts "5- Mostrar fixture."
puts "6- Agregar nuevo resultado."
puts "7- Mostrar resultados."
puts "8- Salir."

option_correct = false

until option_correct == true do
    puts "--------------------------"
    print "Ingrese un numero valido: "
    input = gets.chomp.to_i

    if input < 9 && input > 0
        option_correct = true
    end
end

case input.to_i
when 1 #Registar torneo.
    puts "--------------------------"
    print "Ingrese el nombre del torneo: "
    name = gets.chomp
    register = new_tournament(name)

    if  register == true
        puts "Torneo registrado."
    else
        puts "Torneo no registrado."
    end
when 2 #Registar equipo.
    print "Ingrese el nombre del torneo: "
    tournament = gets.chomp

    print "Ingrese el nombre del equipo: "
    team = gets.chomp
    register = new_team(team, tournament)

    if  register == true
        puts "Equipo registrado."
    else
        puts "Equipo no registrado."
    end
when 3

when 4

when 6

when 7

when 8
    puts "Gracias por usar el sistema. ¡Hasta luego!"
    exit
else
    puts "El numero que fue ingresado no es valido."
end 
    