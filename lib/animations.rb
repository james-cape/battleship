class Animations

  def initialize(computer_board, user_board)
    @gameplay = Gameplay.new
    @computer_board = computer_board
    @user_board = user_board
  end

  def ship_screen
    puts "\e[H\e[2J"
    puts "\n"
    puts "\n"
    puts "          __   _           __   _              __   _"
    puts "        _(  )_( )_       _(  )_( )_          _(  )_( )_"
    puts "       (_   _    _)     (_   _    _)       (_   _    _)"
    puts "         (_) (__)         (_) (__)           (_) (__)"
    puts "\n"
    puts "\n"
    puts "               ,,=================================.."
    puts "              //   _ _   _ _   _ _   _ _   _ _   _ ]]"
    puts "        ..___//                                    }}"
    puts "      //                                           ]]"
    puts "     // = = = = = = = = SHIP INFORMATION = = = = = \\\\"
    puts "       --------              __-_ _-    _-___ _-    ]]"
    puts "               \\\\          //   \\\\     //   \\\\      ]]"
    puts "                \\\\ =================================="
    puts "          \"_.~\"(_.~\"(_.~\"(_.~\"(_.~\"(_.~\"(_.~\"(_.~\"(_.~\"("
    puts "\n"
  end

  def display_boards(computer_board, user_board)
    binding.pry
    puts "\n\n"
    puts "    =============COMPUTER BOARD============="
    puts @gameplay.board.render(true)
    puts "\n"
    puts "    ==============PLAYER BOARD=============="
    puts @gameplay.render(true)
    puts "\n\n\n\n"
  end




end
