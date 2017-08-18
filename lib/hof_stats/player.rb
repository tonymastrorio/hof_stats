class HofStats::Player

    attr_accessor :name, :year, :votes, :percent, :url

    @@all = []

    def self.new_from_index(p)
        self.new(
            p.css("td[data-stat='player']").text,
            p.css("th[data-stat='year_ID']").text,
            p.css("td[data-stat='votes']").text,
            p.css("td[data-stat='votes_pct']").text,
            "http://baseball-reference.com#{p.css("td a").attribute("href").text}"
            )
    end

    def initialize(name=nil, year=nil, votes=nil, percent=nil, url=nil)
        @name = name
        @year = year
        @votes = votes
        @percent = percent
        @url = url
        @@all << self
    end

    def self.all
        @@all
    end

end