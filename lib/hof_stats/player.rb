class HofStats::Player

    attr_accessor :name, :year, :votes, :percent, :url, :games, :runs, :hits, :homers, :batting_avg, :era, :wlpercent, :strikeouts, :position

    @@all = []

    def self.new_from_index(p)
        self.new(
            p.css("td[data-stat='player']").text,
            p.css("th[data-stat='year_ID']").text,
            p.css("td[data-stat='votes']").text,
            p.css("td[data-stat='votes_pct']").text,
            "https://baseball-reference.com#{p.css("td a").attribute("href").text}"
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
    end

    def runs
        @runs = doc.css("tfoot td[data-stat='R']").first.text
    end

    def hits
        @hits = doc.css("tfoot td[data-stat='H']").first.text
    end

    def homers
        @homers = doc.css("tfoot td[data-stat='HR']").first.text
    end

    def batting_avg
        @batting_avg = doc.css("tfoot td[data-stat='batting_avg']").first.text
    end

    def era
        @era = doc.css("tfoot td[data-stat='earned_run_avg']").first.text
    end

    def wlpercent
        @wlpercent = doc.css("tfoot td[data-stat='win_loss_perc']").first.text
    end

    def strikeouts
        @strikeouts = doc.css("tfoot td[data-stat='SO']").first.text
    end

    def position
        @position = doc.xpath("//*[@id='meta']/div[2]/p[1]/text()").text.strip
    end

    def doc
        @doc = Nokogiri::HTML(open(self.url))
    end

end