require 'pry'

class Cast
    attr_accessor :url, :name, :gender, :born, :status, :title,
    
    @@all = []


    def self.new_cast(cast)
        self.new(
            cast.css("a figure figcaption.category-page__trending-page-title").text,
            "https://theoffice.fandom.com#{cast.css("a").attribute("href").text}"
        )
        binding.pry
    end
    

    def initialize(name=nil, url=nil)
        @name = name
        @url = url
        @@all << self
    end

    def self.all
        @@all
    end
end