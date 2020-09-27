class CLI

    def call
        #  binding.pry
       CastScraper.scrape_cast
    #    binding.pry
        welcome_message
    end
    

    def welcome_message
        puts "Welcome to The Office quotes generator!!"
        
        play
    end

    def play
        puts "if you would like to see some of your favorite office quotes enter Y, or if you want to exit, enter exit"

        input = gets.strip

        case input
        when "Y"
            cast_list
        when "exit"
            exit_message
        else
            puts "Sorry invalid input, please try again."
            play

        end
    end 

    def cast_list
        puts "Enter the number to see who said the quote."
        puts ""
        puts "The Office quotes:"
        Cast.all.each_with_index do |quotes, index|
            puts "#{index + 1}. #{quotes.content}"
        end
        # input = gets.strip.to_i
        # pick_cast(input)
        pick_cast
    end
    

    def pick_cast
        puts "Enter the number to see who said the quote."

        input = gets.strip
        # cast = Cast.find_by_name(quote)
        cast = Cast.find(input.to_i)
        # cast.each do |c|
        #    puts quote: "#{c.content}"
        cast_info(cast)
        # binding.pry
        # cast_list(cast)
    end

    def cast_info(cast)
        puts ""
        puts "#{cast.content}"
        puts "#{cast.character}"
        puts ""
        # binding.pry

    end

    

    def exit_message
        puts "Thank you for checking out the office cast members. Goodbye!"
    end
end