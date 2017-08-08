class Towers_Of_Hanoi
    
    def initialize()
        puts "How many discs do you want to play with?"
        @discs = gets.chomp.to_i
        @source_arr = @discs.downto(1).to_a
        @dest_arr = []
        @aux_arr = [] 
        @expected_arr = @discs.downto(1).to_a
        @count = 0
    end
    
    def play()
        puts "Which disc do you want to move?"
        disc_number = gets.chomp.to_i
        puts "Enter a source tower"
        from = gets.chomp
        puts "Enter a destination tower"
        to = gets.chomp 
        make_a_move(disc_number, from, to)
    end
    
    def make_a_move(disc_number, from, to)
        puts("Expected output at dest_arr is: ",@expected_arr)
        tower_hash = {"source_arr"=>@source_arr, "dest_arr"=>@dest_arr, "aux_arr"=>@aux_arr}
        while @dest_arr != @expected_arr
            #If user enters invalid source tower
            while !(tower_hash.keys().include?(from))
                puts "Enter a valid source tower"
                from = gets.chomp
            end
            #If user enters invalid destination tower
            while !(tower_hash.keys().include?(to))
                puts "Enter a valid destination tower"
                to = gets.chomp
            end
            if (tower_hash[from] == [])
                while tower_hash[from] != []
                    puts "Choose a valid source tower"
                    from = gets.chomp
                end
            elsif (disc_number != tower_hash[from][-1]) or (disc_number > @discs)
                puts "Enter a valid disc number"
                @count += 1
                play()
            else
                if (tower_hash[to] != []) and (tower_hash[to][-1] < disc_number)
                    puts "Invalid move!"
                    puts "Enter a valid disc number: "
                    @count += 1
                    play()
                else
                    #everything user entered is fine
                    current = tower_hash[from].pop()
                    tower_hash[to].push(current)
                    render()
                    if @expected_arr == @dest_arr
                        puts("Congratulations!! You won!")
                        if @count == ((2**@discs)-1)
                            puts "You completed the game with minimum moves!! :)"
                        else
                            puts "You have completed the game in #{@count} moves!"
                        end
                        break
                    else 
                        puts "Do you want to continue playing?"
                        puts "Please enter quit to quit playing and any key to continue"
                        inp = gets.chomp
                        if inp == "quit"
                            return
                        else
                            @count += 1
                            play()
                        end
                    end
                end
            end
        end
    end
    
    def render()
        puts("This is the current state of the board: ")
        print(@source_arr.size," ", @aux_arr.size, " ", @dest_arr.size)
        puts ""
    end
end

T1 = Towers_Of_Hanoi.new()
T1.play()



