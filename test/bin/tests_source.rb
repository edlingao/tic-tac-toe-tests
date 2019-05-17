require 'colorize'
#player.rb
require './lib/player'
#board.rb
require './lib/board'
#game.rb
require './lib/game'

#tic-test-win.rb
require '../lib/tic-test-wins'
#tic-test-draw.rb
require '../lib/tic-test-draw'
#menu_module.rb
require '../../lib/menu_module'

include TestWins
include TestDraw
include Menu



p1 = Player.new("E", "X".colorize(:color => :red))
p2 = Player.new("V", "O".colorize(:color => :cyan))
b = Board.new()
g = Game.new(b,p1,p2)
testing = true
option = 0

while(testing) do
    choose = option
    menu_options = ["Draw tests", "Win tests", "Exit"]
    system("clear")
    puts move_on_menu(option,menu_options)
    part = gets.chomp
    option += select_from_menu(part)
    option = 0 if option == 3 || option <= 0


    if option >= 10
        case choose
            when 0 then 

                test_draw = 0
                test_draw = draw_test?(g,p1,p2)
                puts "\n\nEVERY DRAW TEST WAS SUCCESFULL!!" if test_draw == 5
                sleep(3)
                option = 0

            when 1 then 
                test_p1 = 0
                test_p2 = 0

                #TEST WINS
                system("clear")
                puts "WIN TEST\n"
                test_p1 = win_test?(g,p1,p1,p2)
                test_p2 = win_test?(g,p2,p1,p2)

                if(test_p1 == 8 && test_p2 == 8)
                    puts "EVERY WIN TEST WAS SUCCES!!!" 
                end
                sleep(3)
                option = 0
            when 2 then 
                testing = false
                puts "Exiting..."
                
        end
    end
    
    
end