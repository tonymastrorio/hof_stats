class HofStats::CLI

    def call
        list_players
        menu
        goodbye
    end

    def list_players
        HofStats::Scraper.new.make_player
        puts "MLB Hall of Famers"
        @players = HofStats::Player.all
        @players.each_with_index do |player, i|
            puts "#{i+1}. #{player.name} - #{player.year} - #{player.votes} votes - #{player.percent}%"
        end
    end

    def list_individual_player(player_index)
        puts "Player Name:      #{HofStats::Player.all[player_index].name}"
        puts "Position:         #{HofStats::Player.all[player_index].position}"
        puts "Games:            #{HofStats::Player.all[player_index].games}"
        puts "Hits:             #{HofStats::Player.all[player_index].hits}"
        puts "Runs:             #{HofStats::Player.all[player_index].runs}"
        puts "Homers:           #{HofStats::Player.all[player_index].homers}"
        puts "Batting Average: #{HofStats::Player.all[player_index].batting_avg}"
    end

    def menu
        input = nil
        while input != "exit"
            puts "Enter the line number of a player to see more info."
            puts "Type 'list' to see the list of players again."
            puts "Type 'exit' to exit."
            input = gets.strip.downcase
            if input.to_i > 0
                player_index = input.to_i - 1
                list_individual_player(player_index)
            elsif input == "list"
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