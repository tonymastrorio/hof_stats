class HofStats::Player

    attr_accessor :name, :year, :votes, :percent, :url, :games, :runs, :hits, :homers, :batting_avg

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

    def games
        @games = doc.css("tfoot td[data-stat='G']").first.text
        binding.pry
    end

    def runs
        @runs = doc.css("tfoot td[data-stat='R']").first.text
        binding.pry
    end

    def hits
        @hits = doc.css("tfoot td[data-stat='H']").first.text
        binding.pry
    end

    def homers
        @homers = doc.css("tfoot td[data-stat='HR']").first.text
        binding.pry
    end

    def batting_avg
        @batting_avg = doc.css("tfoot td[data-stat='batting_avg']").first.text
        binding.pry
    end

    def doc
        @doc = Nokogiri::HTML(open(self.url))
    end

end