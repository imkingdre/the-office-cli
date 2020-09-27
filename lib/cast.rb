class Cast
    attr_accessor :content, :character, :firstname, :lastname
    
    @@all = []

    # def initialize(firstname=nil, lastname=nil, id=nil)
    #     @firstname = firstname
    #     @lastname = lastname
    #     @id = id
    #     @@all << self
    # end

    def initialize(attr_hash)
        attr_hash.each do |k, v|
            self.send("#{k}=", v) if self.respond_to?("#{k}=")
        end
        save
    end
    
    def save
        @@all << self
    end

    def self.all
        @@all
    end

    # def self.find_by_name(name)
    #     self.all.select do |quote|
    #         quote.content.downcase == name
    #     end 
    def self.find(index)
        @@all [index -1]
    end


end