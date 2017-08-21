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
            if player.votes == ""
                player.votes = "N/A"
            end
            if player.percent == ""
                player.percent = "N/A %"
            end
            puts "#{i+1}. #{player.name} - #{player.year} - #{player.votes} votes - #{player.percent}"
        end
    end

    def list_individual_player(player)
        puts "Player Name:      #{player.name}"
        if player.position == "" || player.position == "Manager"
            puts "No stats available for #{player.name}."
        else
            puts "Position:         #{player.position}"
            if player.position.include? "Pitcher"
                puts "ERA:              #{player.era}"
                puts "W/L %:            #{player.wlpercent}"
                puts "Strikeouts:       #{player.strikeouts}"
            else
                puts "Games:            #{player.games}"
                puts "Hits:             #{player.hits}"
                puts "Runs:             #{player.runs}"
                puts "Homers:           #{player.homers}"
                puts "Batting Average: #{player.batting_avg}"
            end
        end
    end

    def menu
        input = nil
        puts ""
        puts "Enter the line number of a player to see more info."
        puts "Type 'exit' to exit."

        input = gets.strip.downcase

        if input == "exit"
            goodbye
            exit()
        elsif input.to_i < 1 || input.to_i > HofStats::Player.all.length
            puts "Please enter a valid line number."
            menu
        else
            player = HofStats::Player.all[input.to_i - 1]

            puts "***************************"
            list_individual_player(player)
            puts "***************************"

            puts "Would you like to see another player? (Y or N)"
            input = gets.strip.downcase
            if input == "y"
                menu
            end
        end
    end

    def goodbye
        puts "Goodbye!"
    end
end