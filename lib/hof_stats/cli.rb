class HofStats::CLI

    def call
        list_players
        menu
        goodbye
    end

    def list_players
        puts "MLB Hall of Famers"
        @players = HofStats::Player.all
    end

    def menu
        input = nil
        while input != "exit"
            puts "Enter the line number of a player to see more info."
            puts "Type 'list' to see the list of players again."
            puts "Type 'exit' to exit."
            input = gets.strip.downcase
            case input
            when "1"
                puts "More info on 1..."
            when "2"
                puts "More info on 2..."
            when "list"
                list_players
            else
                puts "That is not a valid command. Type 'list' or 'exit'."
            end
        end
    end

    def goodbye
        puts "Goodbye! Wonder if Pete Rose will ever make it to the Hall of Fame..."
    end
end