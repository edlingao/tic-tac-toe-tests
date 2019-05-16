#tic-tac-test-win.rb
require './test/lib/tic-test-wins.rb'
#tic-tac-test-draw.rb
require './test/lib/tic-test-draw.rb'
#game.rb
require './lib/game.rb'
#board.rb
require './lib/board.rb'
#player.rb
require './lib/player.rb'

require 'colorize'


include TestWins
include TestDraw

p1 = Player.new("E", "X".colorize(:color => :red))
p2 = Player.new("V", "O".colorize(:color => :cyan))
b = Board.new()
g =Game.new(b,p1,p2)
bp = b.board_position

RSpec.describe TestWins do
    describe "#win_test?" do
        it "Returns if every case of a win was recognize as a win" do
            

            test_p1 = 0
            test_p2 = 0

            test_p1 = win_test?(g,p1,p1,p2)
            test_p2 = win_test?(g,p2,p1,p2)
            expect(test_p1).to eql(8)
            expect(test_p2).to eql(8)
        end

    end

end

RSpec.describe TestDraw do
    describe "#draw_test?" do
        it "Returns if 5 draw cases are recognize as a draw" do
            test_draw = 0
            test_draw = draw_test?(g,p1,p2)
            expect(test_draw).to eql(5)
        end
    end
end

RSpec.describe Player do
    describe "#initialice" do
        it "Fills a player with the correspond information" do
            symbol = "X".colorize(:color => :red)

            expect(p1.name).to eql("E")
            expect(p1.symbol).to eql(symbol)
            
            symbol = "O".colorize(:color => :cyan)

            expect(p2.name).to eql("V")
            expect(p2.symbol).to eql(symbol)
        end
    end
end


RSpec.describe Board do
    describe "#print_board" do
        it "Prints the board on the screen" do
            board = "
           #{bp[0]} | #{bp[1]} | #{bp[2]}
           --|---|--
           #{bp[3]} | #{bp[4]} | #{bp[5]}
           --|---|--
           #{bp[6]} | #{bp[7]} | #{bp[8]}\n"

           expect(b.print_board).to eql(board)

        end
    end

    describe "#play_position" do
        it "Place the symbol to the specific coordenate" do
            symbol = "X".colorize(:color => :red)

            board = "
           #{bp[0]} | #{bp[1]} | #{bp[2]}
           --|---|--
           #{bp[3]} | #{symbol} | #{bp[5]}
           --|---|--
           #{bp[6]} | #{bp[7]} | #{bp[8]}\n"
            b.play_position(4,p1.symbol)
            expect(b.print_board).to eql(board)
        end
    end
end