require 'colorize'
class Game
    attr_accessor :board, :player1, :player2, :space
    def initialize(fboard, player1, player2)
        @board = fboard
        @player1 = player1
        @player2 = player2
        @space = 0
    end

    def cats_game?
        b = board.board_position
        space = 0
        b.each_with_index{|value,i|
            space += 1 if value != "#{i}".colorize(:color => :blue)
        }
        
        return true if space == 9
        return false if space < 9
    end
    def win?(p)

        win_b = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]];
        
        win_b.any?{|win|
            win.all?{|posi|
                board.board_position[posi] == p.symbol
            }
        }
        
        
    end

    def turn(player, pos)
        
        if is_playable?(board, pos, player)
            board.play_position(pos,player.symbol)     
            return board.print_board()
        else
            return "Is not possible to play on that coordenate"
        end

    end

    private
    def is_playable?(board, pos,player)

        return board.board_position[pos] == player1.symbol ? false : board.board_position[pos] == player2.symbol ? false : true
    end


    
end
