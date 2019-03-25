require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/computer'
require 'pry'

puts "Welcome to BATTLESHIP"
puts "Enter p to play. Enter q to quit."
play_or_quit = nil

while play_or_quit != "q"

  play_or_quit = gets.chomp.downcase
  if play_or_quit == "q"
    break
  elsif play_or_quit != "q" && play_or_quit != "p"
    puts "You did not enter p or q."
  else

    puts "Enter a height for your board: "
    height = gets.chomp
    puts "Enter a width for your board: "
    width = gets.chomp
    # ^^^ Include error if ships can't fit
    #     Include size limit like 40 x 40
    #     Reject negatives, 0, etc

    puts "\n"
    puts "\n"
    puts "      __   _           __   _              __   _"
    puts "    _(  )_( )_       _(  )_( )_          _(  )_( )_"
    puts "   (_   _    _)     (_   _    _)       (_   _    _)"
    puts "     (_) (__)         (_) (__)           (_) (__)"
    puts "\n"
    puts "\n"
    puts "           ,,=================================.."
    puts "          //   _ _   _ _   _ _   _ _   _ _   _ ]]"
    puts "    ..___//                                    }}"
    puts "  //                                           ]]"
    puts " // = = = = = = = = SHIP INFORMATION = = = = = \\\\"
    puts "   --------              __-_ _-    _-___ _-    ]]"
    puts "           \\\\          //   \\\\     //   \\\\      ]]"
    puts "            \\\\ =================================="
    puts "      \"_.~\"(_.~\"(_.~\"(_.~\"(_.~\"(_.~\"(_.~\"(_.~\"(_.~\"("
    puts "\n"

    computer_ships = []
    user_ships = []

    # Need to limit size of ships to board length/width, and available space.

    another_ship = "S"
    while another_ship == "S"
      puts "\nEnter the type of ship: "
      ship_name = gets.chomp
      puts "\nEnter the ship's length: "
      ship_length = gets.chomp.to_i
      computer_ship = Ship.new(ship_name, ship_length)
      user_ship = Ship.new(ship_name, ship_length)

      computer_ships << computer_ship
      user_ships << user_ship

      puts "\nEnter S for another ship, or P to play"
      another_ship = gets.chomp.upcase
      while another_ship != "P" && another_ship != "S"
        puts "Please re-enter P or S"
        another_ship = gets.chomp.upcase
      end
    end

    user_board = Board.new(height, width)
    computer_board = Board.new(height, width)

    computer = Computer.new(computer_board, computer_ships)

### Come back and try to implement ship.reset and board.reset to simplify above code.

    computer.feed_ships

    puts "I have laid out my ships on the grid."
    puts "You now need to lay out your #{user_ships.length} ships."
    puts "The Cruiser is two units long and the Submarine is three units long.\n"
    puts "#{user_board.render(true)}"

    user_ships.each do |ship|
      cells_on_grid = false
      cells_consecutive = false
      cells_overlap = true
      while cells_on_grid == false || cells_consecutive == false || cells_overlap == true

        puts "Enter #{ship.length} squares for the #{ship.name} (i.e. A1 A2 A3):"
        user_cells = gets.chomp.upcase.split(" ")

        user_cells.each do |cell|
          cells_on_grid = true if user_board.valid_coordinate?(cell)
          cells_overlap = false if user_board.cells[cell].empty?

        end
        cells_consecutive = true if user_board.valid_placement?(ship, user_cells)

        if cells_on_grid == false || cells_consecutive == false || cells_overlap == true
          puts "Those are invalid coordinates. Please try again: "
        else
          user_cells.each do |cell|
            user_board.cells[cell].place_ship(ship)
          end
        end
      end
    end  # End of ships placing ships

    available_computer_shots = user_board.cells.keys

    # Checks if all user ships are sunk before allowing user to take a shot.
    until computer_ships.all? { |ship| ship.sunk == true } || user_ships.all? { |ship| ship.sunk == true }
      if computer_ships.all? { |ship| ship.sunk == true }
      else
        # Both boards are displayed with user's ships showing.
        puts "\n\n"
        puts "=============COMPUTER BOARD============="
        puts computer_board.render(true)
        puts "\n"
        puts "==============PLAYER BOARD=============="
        puts user_board.render(true)
        puts "\n\n"

        # Player takes the first shot.
        puts "Enter the coordinate for your shot: "
        user_shot = gets.chomp.upcase
        puts "==============PLAYER SHOT=============="

        while !computer_board.valid_coordinate?(user_shot)
          puts "Your shot was not a valid coordinate. Try again: "
          user_shot = gets.chomp.upcase
        end

        while computer_board.cells[user_shot].fired_upon == true
          puts "Your shot was in a spot already fired upon. Please enter another shot: "
          user_shot = gets.chomp.upcase
        end

        computer_board.cells[user_shot].fire_upon

        if computer_board.cells[user_shot].empty?
          puts "Your shot on #{user_shot} was a miss."
        else
          puts "Your shot on #{user_shot} was a hit!"
          if computer_board.cells[user_shot].ship.sunk?
            puts "Your shot on #{user_shot} sunk a #{computer_board.cells[user_shot].ship.name.downcase}!"
            if computer_ships.all? { |ship| ship.sunk == true }
              puts "Game Over. You won!"
              puts "=============GAME OVER===============\n"
              puts "Enter p to play again. Enter q to quit."
              # Add computer vs user score
              break
            end
          end
        end

        # Checks if all computer ships are sunk before allowing computer to take a shot.
        if user_ships.all? { |ship| ship.sunk == true }
        else


        ## Easy mode
        ## Computer takes a random shot
        last_shot = "miss"
          if game_mode == "easy"
  ####################
            computer_shot = available_computer_shots.sample
            available_computer_shots.delete(computer_shot)
            puts "\n==============COMPUTER SHOT=============="

            if user_board.cells[computer_shot].empty?
              user_board.cells[computer_shot].fire_upon

              puts "My shot on #{computer_shot} was a miss."
            else
              user_board.cells[computer_shot].fire_upon
              puts "My shot on #{computer_shot} was a hit!"
              if user_board.cells[computer_shot].ship.sunk?
                puts "My shot on #{computer_shot} sunk a #{user_board.cells[computer_shot].ship.name.downcase}!"
                if user_ships.all? { |ship| ship.sunk == true }
                  puts "Game over. I - the computer - won!"
                  puts "===============GAME OVER===============\n"
                  puts "Enter p to play again. Enter q to quit."
                  break
                end
              end
            end # End verbage output logic
  ####################


          elsif game_mode == "medium"

            if last_shot == ["miss", computer_shot]

              computer_shot = available_computer_shots.sample
              available_computer_shots.delete(computer_shot)
              puts "\n==============COMPUTER SHOT=============="

              if user_board.cells[computer_shot].empty?
                user_board.cells[computer_shot].fire_upon
                last_shot = "miss"
                puts "My shot on #{computer_shot} was a miss."

              else
                user_board.cells[computer_shot].fire_upon
                last_shot = "hit"
                puts "My shot on #{computer_shot} was a hit!"

                if user_board.cells[computer_shot].ship.sunk?
                  puts "My shot on #{computer_shot} sunk a #{user_board.cells[computer_shot].ship.name.downcase}!"
                  if user_ships.all? { |ship| ship.sunk == true }
                    puts "Game over. I - the computer - won!"
                    puts "===============GAME OVER===============\n"
                    puts "Enter p to play again. Enter q to quit."
                    break
                  end
                end
              end # End verbage output logic

            else # last_shot == "hit"

              # Look one cell up
                # If fired_upon == false, fire on it.
                  # If that's a hit, keep going in that direction (# If fired_upon == false, fire on it.)
                    # If ship sinks, back to random shots
                    # If miss, reverse direction
                  # If that's a miss, keep rotating.

              # Use valid_coordinate? to decide whether to skip to next rotational.



              computer_shot = available_computer_shots.sample
              available_computer_shots.delete(computer_shot)
              puts "\n==============COMPUTER SHOT=============="

              if user_board.cells[computer_shot].empty?
                user_board.cells[computer_shot].fire_upon
                last_shot = "miss"
                puts "My shot on #{computer_shot} was a miss."

              else
                user_board.cells[computer_shot].fire_upon
                last_shot = "hit"
                puts "My shot on #{computer_shot} was a hit!"

                if user_board.cells[computer_shot].ship.sunk?
                  puts "My shot on #{computer_shot} sunk a #{user_board.cells[computer_shot].ship.name.downcase}!"
                  if user_ships.all? { |ship| ship.sunk == true }
                    puts "Game over. I - the computer - won!"
                    puts "===============GAME OVER===============\n"
                    puts "Enter p to play again. Enter q to quit."
                    break
                  end
                end
              end # End verbage output logic

            end



  ####################
          else #if game_mode == "hard"



          end

        end # End computer turn
  ####################
      end
    end

  end

end

## Computer takes a random shot at a cell that appears in the most combos

# If previous shot was a hit, cycle around and chase until ship is sunk.

# if previous shot was a miss, pick another random cell that appears in the most combos.
#
#
# sleep(3)
#
##
#