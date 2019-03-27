class Gameplay

  attr_reader :play_or_quit,
              :computer_ships,
              :user_ships,
              :another_ship

  def initialize
  end

  def start
    @play_or_quit = ""
    @computer_ships = []
    @user_ships = []
    @screen_message = ""

    puts "\e[H\e[2J"
    @startup = Animations.new
    @startup.start_animation
    @play_or_quit = gets.chomp.downcase

    until @play_or_quit == "q"
      if @play_or_quit == "p"
        input_board_size
        puts "\e[H\e[2J"
        @startup.start_animation
        @play_or_quit = gets.chomp.downcase
      else
        puts "\n\n    You did not enter p or q. Enter p or q: "
        @play_or_quit = gets.chomp.downcase
      end
    end
  end

  def input_board_size
    puts "\n\n    Enter a height for your board: "
    height = gets.chomp

    until height.to_i.between?(1, 25)
      puts "\n\n    Enter a height between 1 and 25 for your board: "
      height = gets.chomp
    end

    puts "\n\n    Enter a width for your board: "
    width = gets.chomp

    until width.to_i.between?(1, 25)
      puts "\n\n    Enter a width between 1 and 25 for your board: "
      width = gets.chomp
    end
    @user_board = Board.new(height, width)
    @computer_board = Board.new(height, width)
    @animations = Animations.new(@computer_board, @user_board)
    @computer = Computer.new(@computer_board, computer_ships)
    @available_computer_shots = @user_board.cells.keys
    input_ships
  end

  def input_ships
    @animations.ship_screen
    @another_ship = "S"
    input_another_ship
  end

  def input_another_ship
    while @another_ship == "S"
      puts "\n    Enter the type of ship: "
      ship_name = gets.chomp
      puts "\n    Enter the ship's length: "
      ship_length = gets.chomp

      until ship_length.to_i.between?(1, @computer_board.rows.length) && ship_length.to_i.between?(1, @computer_board.columns.length)
        puts "\n    Ship's length must be less than board size and width (#{@computer_board.rows.length} x #{@computer_board.columns.length}). "
        puts "\n    Please enter new ship size: "
        ship_length = gets.chomp
      end

      computer_ship = Ship.new(ship_name, ship_length.to_i)
      user_ship = Ship.new(ship_name, ship_length.to_i)

      @computer_ships << computer_ship
      @user_ships << user_ship
      puts "\n    Enter S for another ship, or P to play"
      @another_ship = gets.chomp.upcase
      while @another_ship != "P" && @another_ship != "S"
        puts "\n    Please re-enter P or S"
        @another_ship = gets.chomp.upcase
      end
    end
    computer_places_ships
  end

  def computer_places_ships
    @computer.feed_ships
    user_places_ships
  end

  def user_places_ships
    puts "\e[H\e[2J"
    puts "    I have laid out my ships on the grid."
    puts "    You now need to lay out your #{@user_ships.length} ships.\n\n"
    puts "#{@user_board.render(true)}"

    @user_ships.each do |ship|
      cells_on_grid = false
      cells_consecutive = false
      cells_overlap = true

      while cells_on_grid == false || cells_consecutive == false || cells_overlap == true

        puts "\n\n    Enter #{ship.length} squares for the #{ship.name} (i.e. A1 A2 A3):"
        user_cells = gets.chomp.upcase.split(" ").sort

        user_cells.each do |cell|
          cells_on_grid = true if @user_board.valid_coordinate?(cell)
          cells_overlap = false if @user_board.cells[cell].empty?
        end

        cells_consecutive = true if @user_board.valid_placement?(ship, user_cells)

        if cells_on_grid == false || cells_consecutive == false || cells_overlap == true
          puts "    Those are invalid coordinates. Please try again: "
        else
          user_cells.each do |cell|
            @user_board.cells[cell].place_ship(ship)
          end
        end
      end
    end
    check_if_user_ships_all_sunk
  end

  def check_if_user_ships_all_sunk
    until computer_ships.all? { |ship| ship.sunk? } || user_ships.all? { |ship| ship.sunk? }
      if computer_ships.all? { |ship| ship.sunk? }
      else
        won = player_takes_shot
        @animations.display_boards(@computer_board, @user_board)
        if !won
          sleep(2)
          computer_takes_shot
          @animations.display_boards(@computer_board, @user_board)
        end
      end
    end
  end

  def player_takes_shot
    puts "\n    Enter the coordinate for your shot: "
    user_shot = gets.chomp.upcase
    puts "\e[H\e[2J"
    puts "\n    ==============PLAYER SHOT=============="

    while !@computer_board.valid_coordinate?(user_shot)
      puts "    Your shot was not a valid coordinate. Try again: "
      user_shot = gets.chomp.upcase
    end

    while @computer_board.cells[user_shot].fired_upon == true
      puts "    Your shot was in a spot already fired upon. Please enter another shot: "
      user_shot = gets.chomp.upcase
    end
    @computer_board.cells[user_shot].fire_upon
    @animations.warning_incoming
    return evaluate_user_shot(user_shot)
  end

  def evaluate_user_shot(user_shot)
    if @computer_board.cells[user_shot].empty?
      puts "    Your shot on #{user_shot} was a miss."
    else
      puts "    Your shot on #{user_shot} was a hit!"
      if @computer_board.cells[user_shot].ship.sunk?
        puts "    Your shot on #{user_shot} sunk a #{@computer_board.cells[user_shot].ship.name.downcase}!"
        if computer_ships.all? { |ship| ship.sunk? }
          @animations.display_boards(@computer_board, @user_board)
          puts "    Game Over. You won!"
          puts "    =============GAME OVER===============\n\n\n\n"
          sleep(2)
          @animations.splode
          @animations.ending("You won!")
          @play_or_quit = ""
          @user_ships = []
          @computer_ships = []
          return true
        end
      end
    end
    return false
  end

  def check_if_computer_ships_all_sunk
    computer_takes_shot if !user_ships.all? { |ship| ship.sunk? }
  end


  def computer_takes_shot
    computer_shot = @available_computer_shots.sample
    @available_computer_shots.delete(computer_shot)
    puts "\e[H\e[2J"
    puts "\n    =============COMPUTER SHOT============="
    @animations.warning_incoming
    evaluate_computer_shot(computer_shot)
  end

  def evaluate_computer_shot(computer_shot)
    if @user_board.cells[computer_shot].empty?
      @user_board.cells[computer_shot].fire_upon

      puts "    My shot on #{computer_shot} was a miss."
    else
      @user_board.cells[computer_shot].fire_upon
      puts "    My shot on #{computer_shot} was a hit!"
      if @user_board.cells[computer_shot].ship.sunk?
        puts "    My shot on #{computer_shot} sunk a #{@user_board.cells[computer_shot].ship.name.downcase}!"
        if user_ships.all? { |ship| ship.sunk? }
          @animations.display_boards(@computer_board, @user_board)
          puts "    Game over. The computer won!"
          puts "    ===============GAME OVER===============\n\n\n\n"
          sleep(2)
          @animations.splode
          @animations.ending("The computer won!")
          @play_or_quit = ""
          return true
        end
      end
    end
    return false
  end
end
