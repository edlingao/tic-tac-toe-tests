require 'colorize'
#board.rb
require_relative '../lib/board.rb'
#player.rb
require_relative '../lib/player'
#game.rb
require_relative '../lib/game'
#menu_module.rb
require_relative '../lib/menu_module'

include Menu


def play(win,players,g,board)
    i = 0
    cats_game = false
    while(!win)
        system("clear")
        puts board.print_board();
        puts "Its #{players[i].name} turn"
        print "Input the number in wich you want to play: "
        pos = gets.chomp
        
        prbr = g.turn(players[i], pos.to_i)
        case prbr
            when "Is not possible to play on that coordenate" then 
                puts "Is not possible to play on that coordenate"
                cats_game = g.cats_game?
                sleep(1)
            else
                puts prbr    
                win = g.win?(players[i])
                cats_game = g.cats_game?
                i = i >= 1 ? 0 : 1
        end
        if win
            winner = i - 1
            i = 10
            10.times{
                system("clear")
                puts board.print_board();
                puts "Congratulations #{players[winner].name}\n YOU WIN!!\nReturning to main menu in.. #{i}"
                sleep(1)
                i-=1
            }
        end
        
        if cats_game && !win
            win = true
            pi = 10
            10.times{
                system("clear")
                puts board.print_board();
                puts "CATS GAME!!!\nNone players win!!\nReturning to main menu in.. #{i}"
                sleep(1)
                i-=1
            }
        end
        
    
    end
    j = 10
    
end




exbo = Board.new()

playing = true
option = 0

i = 0
has_win = false



while(playing) do
    choose = option
    system("clear")
    puts move_on_menu(option)
    part = gets.chomp
    option += select_from_menu(part)
    option = 0 if option == 3 || option <= 0


    if option >= 10
        case choose
            when 0 then 
                option = 0
                system("clear")
                print "Set a name for the player 1: "
                name1 = gets.chomp
                print "Set a symbol to play for player 1: "
                symbol1 = gets.chomp
                system("clear")
                print "Set a name for the player 2: "
                name2 = gets.chomp
                print "Set a symbol to play for player 2: "
                symbol2 = gets.chomp

                p1 = Player.new(name1,symbol1.colorize(:color => :red))
                p2 = Player.new(name2,symbol2.colorize(:color => :cyan))
                players = [p1,p2]
                board = Board.new()
                g = Game.new(board,p1,p2)
                play(has_win,players,g,board)

            when 1 then 
                j = 10
                for i in 1 .. 10
                    system("clear")
                    puts instructions(exbo);
                    puts "Returning to menu on #{j}... seconds"
                    j -= 1
                    sleep(1)
                    
                end
                option = 0
                
            when 2 then 
                playing = false
                puts "Exiting..."
                
        end
    end
    
    
end




