class CastScraper

    def self.scrape_cast
        

        html = RestClient.get("https://www.officeapi.dev/api/quotes")
        
        office_characters=JSON.parse(html.body)
        office_array = office_characters["data"]
        office_array.each do |quote|
            Cast.new(quote)
        end


    end
    
    def send_cast
        self.scrape_cast.each do |cast|
            Cast.new_cast(cast)
        end
    end
end