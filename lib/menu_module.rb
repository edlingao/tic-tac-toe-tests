require 'colorize'
module Menu
    def select_from_menu(option)
        super_option = option.to_s
    
        if super_option == "\e[A"
            return -1
        elsif super_option == "\e[B"
            return 1
        elsif super_option == "s" || super_option == "" || super_option == "S"
    
            return 10
        else
            return 0
        end
    end

    def move_on_menu(option)

        menu_options = ["Play", "Basic instructions", "Exit"]
        display = "To move through options please press up/down key and then press enter\nTo choose an option just press enter or input 'S' or 's' and then press enter key\n\n\t\t--- Menu ---\n"
        menu_options.each_with_index{|value, i|
            if i == option then display += "->#{menu_options[option].colorize(:color => :light_magenta)}\n"
            else display += "#{value}\n"
            end
        }

        return display
    end

    private
    def instructions(bor)
        sym_ex = "X".colorize(:color => :red)
        bor.play_position(0,sym_ex)
        bor.play_position(4,sym_ex)
        bor.play_position(8,sym_ex)

        
        message = "First player is always the first one to play\nYou win when you fill 3 consecutive cells of your symbol ex.\n#{bor.print_board}\nRemember to always have fun an never get mad\nStart by choosing 'Play' on menu"

    end
end