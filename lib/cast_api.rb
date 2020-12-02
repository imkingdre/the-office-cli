class CastScraper

    def self.scrape_cast
        

        html = RestClient.get("https://www.officeapi.dev/api/quotes")
        
        office_characters=JSON.parse(html.body) # making the data i grabbed go into a string
        office_array = office_characters["data"]
        office_array.each do |quote|
            content=quote["content"]
            firstname=quote["character"]["firstname"]
            lastname=quote["character"]["lastname"]
            id=quote["_id"]
            # binding.pry
            Cast.new(content: content, firstname: firstname, lastname: lastname, id: id)
        end
        

    end
    
    # def send_cast
    #     self.scrape_cast.each do |cast|
    #         Cast.new_cast(cast)
    #     end
    # end
end