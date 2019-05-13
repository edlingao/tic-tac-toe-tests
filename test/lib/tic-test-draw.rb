require 'colorize'
#player.rb
require '../../lib/player'
#board.rb
require '../../lib/board'
#game.rb
require '../../lib/game'


module TestDraw
    def fill_board_ex_draw(g,p1,p2, win)

        draws_p1 = [[1,4,6,8,],[0,2,3,5,7],[0,5,6,7],[0,1,4,5,6],[0,1,3,5,7]]
        draws_p2 = [[0,2,3,5,7],[1,4,6,8],[1,2,3,4,8],[2,3,7,8,],[2,4,6,8]]
    
        case win 
            when 1 then 
                draws_p1[0].each{|value|
                    g.turn(p1,value)
                }
                draws_p2[0].each{|value|
                    g.turn(p2,value)
                }
            when 2 then 
                draws_p1[1].each{|value|
                    g.turn(p1,value)
                }
                draws_p2[1].each{|value|
                    g.turn(p2,value)
                }
            when 3 then
                draws_p1[2].each{|value|
                    g.turn(p1,value)
                }
                draws_p2[2].each{|value|
                    g.turn(p2,value)
                }
            when 4 then 
                draws_p1[3].each{|value|
                    g.turn(p1,value)
                }
                draws_p2[3].each{|value|
                    g.turn(p2,value)
                }
            when 5 then 
                draws_p1[4].each{|value|
                    g.turn(p1,value)
                }
                draws_p2[4].each{|value|
                    g.turn(p2,value)
                }
        
            else
                return 100
                
        end
    
    end
    def draw_test?(g,p1,p2) 
        i = 1
        test = 0
        loop do
            if(fill_board_ex_draw(g,p1,p2,10) == 100) 
                b = Board.new()
                g = Game.new(b,p1,p2)
            end
            system("clear")
            puts "Testing draws...\n\n"
            puts "Test #{i}.."
            fill_board_ex_draw(g,p1,p2,i)
            puts b.print_board()
            if g.cats_game?
                puts "Draw!!\n\nPASS" 
                test += 1
            else 
                puts "FAIL" 
            end
            puts "Next test in 2 seconds"
            sleep(2)
            i += 1
            break if i > 5
        end
        test
    end
    
end









