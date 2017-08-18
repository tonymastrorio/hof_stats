class HofStats::Scraper

    def get_page
        Nokogiri::HTML(open("https://www.baseball-reference.com/awards/hof.shtml"))
    end

    def scrape_baseball_index
        self.get_page.css("tbody tr")
    end 

    def make_player
        scrape_baseball_index.each do |p|
            HofStats::Player.new_from_index(p)
        end
    end

end