class CLI

    def call
        #  binding.pry
       CastScraper.scrape_cast # calling my scrape class method on the cast api file
    
        welcome_message
    end
    

    def welcome_message
        puts "Welcome to The Office quotes generator!!"
        
        play
    end

    def play
        puts "if you would like to see some of your favorite office quotes enter Y, or if you want to exit, enter exit"

        input = gets.strip.downcase

        case input
        when "y"
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
        
        pick_cast
    end
    

    def pick_cast
        puts "Enter the number to see who said the quote."

        input = gets.strip
        
        cast = Cast.find(input.to_i)
        cast_info(cast)
    end

    def cast_info(cast)
        puts ""
        puts "#{cast.content}"
        puts "#{cast.firstname} #{cast.lastname}"
        puts ""
        puts "Thank you for checking out the office cast members. Goodbye!"

    end

end