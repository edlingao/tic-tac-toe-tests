require 'colorize'
#player.rb
require '../../lib/player'
#board.rb
require '../../lib/board'
#game.rb
require '../../lib/game'

module TestWins

    def fill_board_ex(g,p,win)

        win_b = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]];
        case win 
            when 1 then 
                win_b[0].each{|value|
                    g.turn(p,value)
                }
            when 2 then 
                win_b[1].each{|value|
                    g.turn(p,value)
                }
            when 3 then
                win_b[2].each{|value|
                    g.turn(p,value)
                }
            when 4 then 
                win_b[3].each{|value|
                    g.turn(p,value)
                }
            when 5 then 
                win_b[4].each{|value|
                    g.turn(p,value)
                }
            when 6 then
                win_b[5].each{|value|
                    g.turn(p,value)
                }
            when 7 then
                win_b[6].each{|value|
                    g.turn(p,value)
                }
            when 8 then 
                win_b[7].each{|value|
                    g.turn(p,value)
                }
            else
                return 100
                
        end
    
    end

    def win_test?(g,p,p1,p2) 
        i = 1
        test = 0
        loop do
            if(fill_board_ex(g,p,10) == 100) 
                b = Board.new()
                g = Game.new(b,p1,p2)
            end
            system("clear")
            puts "Testing wins...\n\n"
            puts "TESTING PLAYER #{p.name}"
            puts "Test #{i}.."
            fill_board_ex(g,p,i)
            puts b.print_board()
            if g.win?(p) 
                puts "WIN!!\n\nPASS" 
                test += 1
            else 
                puts "FAIL" 
            end
            puts "Next test in 2 seconds"
            sleep(2)
            i += 1
            break if i > 8
        end
        test
    end

    
end
























