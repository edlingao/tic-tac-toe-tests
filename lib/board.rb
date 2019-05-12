require 'colorize'
class Board
   attr_accessor :board_position

    def initialize

        bord = Array.new(9)

        for i in 0 .. 8
            bord[i] = "#{i}".colorize(:color => :blue)
        end
        @board_position = bord
    end

    private
 
    public
    def play_position(pos, symbol)
        board_position[pos] = symbol
    end
    def print_board
        board = "
           #{board_position[0]} | #{board_position[1]} | #{board_position[2]}
           --|---|--
           #{board_position[3]} | #{board_position[4]} | #{board_position[5]}
           --|---|--
           #{board_position[6]} | #{board_position[7]} | #{board_position[8]}\n"
        
        return board
    end

    
end

