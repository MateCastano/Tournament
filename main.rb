require_relative 'models/player.rb'
require_relative 'models/team.rb'
require_relative 'models/tournament.rb'
require_relative 'controllers.rb'

puts "¡ Bienvenidos al sistema !"
puts "1- Crear un nuevo torneo."
puts "2- Agregar un nuevo equipo."
puts "3- Ingresar un nuevo jugador."
puts "4- Generar fixture."
puts "5- Mostrar fixture."
puts "6- Agregar nuevo resultado."
puts "7- Mostrar resultados."
puts "8- Salir."

print "Ingrese un numero: "
input = gets

case input.to_i
when 1
    print "Ingrese el nombre del torneo: "
    team = gets.chomp
    register = new_tournament(team)

    if  register == true
        puts "Torneo registrado."
    else
        puts "Torneo no registrado."
    end
when 2

when 3

when 4

when 6

when 7

when 8
else
    puts "El numero que fue ingresado no es valido."
end 
    