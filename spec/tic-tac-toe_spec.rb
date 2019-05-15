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