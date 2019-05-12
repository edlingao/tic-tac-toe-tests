class Player
    attr_accessor :name, :symbol, :win_arr
    def initialize(name,symbol)
        @name = name
        @symbol = symbol
        @win_arr = Array.new(3){Array.new(8)}
    end


end