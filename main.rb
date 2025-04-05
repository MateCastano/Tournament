require_relative 'models/player.rb'
require_relative 'models/team.rb'
require_relative 'models/tournament.rb'

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