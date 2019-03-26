require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/computer'
require './lib/gameplay'
require 'pry'

class GameplayTest < Minitest::Test

  def test_gameplay_exists
    gameplay = Gameplay.new

    expected = Gameplay
    actual   = gameplay
    assert_instance_of expected, actual
  end

  def test_start_menu_assigns_p_q_etc
    gameplay = Gameplay.new
    play_or_quit = "p"

    expected = "p"
    actual   = play_or_quit
    assert_equal expected, actual
  end

  def test_p_at_start_breaks_loop
    gameplay = Gameplay.new
    play_or_quit = "p"

    assert_nil gameplay.play_or_quit
  end

  def test_q_quits_game
    gameplay = Gameplay.new
    play_or_quit = "q"

    assert_nil gameplay.play_or_quit
  end

  def test_not_P_or_Q_
    gameplay = Gameplay.new
    play_or_quit = "f"

    assert_nil gameplay.play_or_quit
  end

  def test_user_can_input_board_size
    gameplay = Gameplay.new
    play_or_quit = "p"
    height = 4
    width  = 4
    user_board = Board.new(height, width)
    computer_board = Board.new(height, width)

    expected = height * width
    actual   = user_board.cells.length
    assert_equal expected, actual
  end

  def test_user_can_input_board_size
    gameplay = Gameplay.new
    play_or_quit = "p"
    height = 4
    width  = 4
    user_board = Board.new(height, width)
    computer_board = Board.new(height, width)

    expected = height * width
    actual   = user_board.cells.length
    assert_equal expected, actual
  end

  def test_user_inputs_ships
    gameplay = Gameplay.new
    play_or_quit = "p"
    height = 4
    width  = 4
    user_board = Board.new(height, width)
    computer_board = Board.new(height, width)


    gameplay.user_places_ships

    # gameplay.input_another_ship

    expected = 1
    actual   = gameplay.computer_ships
    assert_equal expected, actual

  end



end
