class CastScraper

    def open_page

        Nokogiri::HTML(open("https://theoffice.fandom.com/wiki/Category:Characters"))

    end

    def get_cast

        self.open_page.css("div#WikiaArticle.WikiaArticle ul.category__trending-pages li.category__trending-page")

    end

    def send_cast
        self.get_cast.each do |cast|
            Cast.new_cast(cast)
        end
    end
    
    def self.find(index)
        @@all[index -1]
    end

    def doc
        doc ||= Nokogiri::HTML(open(self.url))

    end

    def gender
        @gender ||= doc.css("div.pi-item.pi-data.pi-item-spacing.pi-border-color[data-source=gender] div.pi-data-value.pi-font").text
        
    end
    
    def status
        @status ||= doc.css("div.pi-item.pi-data.pi-item-spacing.pi-border-color[data-source=status] div.pi-data-value.pi-font").text
    end

    def born
        @born ||= doc.css("div.pi-item.pi-data.pi-item-spacing.pi-border-color[data-source=born] div.pi-data-value.pi-font").text
    end

    def title
        @title ||= doc.css("div.pi-item.pi-data.pi-item-spacing.pi-border-color[data-source=title] div.pi-data-value.pi-font").text
    end
end