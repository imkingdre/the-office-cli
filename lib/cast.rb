class Cast
    attr_accessor :content, :firstname, :lastname, :id
    
    @@all = []

    def initialize(firstname:, lastname:, id:, content:)
        # binding.pry
        @firstname = firstname
        @lastname = lastname
        @id = id
        @content = content
        @@all << self
    end

    # def initialize(attr_hash)
    #     attr_hash.each do |k, v|
    #         self.send("#{k}=", v) if self.respond_to?("#{k}=")
    #     end
    #     save
    # end
    
    def save
        @@all << self
    end

    def self.all
        @@all #@@all can be called thoruout the whole class
    end

    def self.find(index)
        @@all [index -1]
    end


end