class HofStats::Player

    attr_accessor :name, :year, :votes, :percent, :url

    def self.all
        #scrape site and return players

        player_1 = self.new
        player_1.name = "Jeff Bagwell"
        player_1.year = "2017"
        player_1.votes = "381"
        player_1.percent = "86.2"
        player_1.url = "https://www.baseball-reference.com/players/b/bagweje01.shtml"

        player_2 = self.new
        player_2.name = "Tim Raines"
        player_2.year = "2017"
        player_2.votes = "380"
        player_2.percent = "86.0"
        player_2.url = "https://www.baseball-reference.com/players/r/raineti01.shtml"
    
        [player_1, player_2]
    end

end