require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require 'pry'
#### A Cell object is a single cell on our board. A Cell can either contain a Ship or nothing.

class CellTest < Minitest::Test

# Removed setup - didn't work well in this test.

  def test_cell_exists
    cell = Cell.new("B4")

    expected = Cell
    actual = cell
    assert_instance_of expected, actual
  end

  def test_cell_has_a_coordinate
    cell = Cell.new("B4")

    expected = "B4"
    actual = cell.coordinate
    assert_equal expected, actual
  end

  def test_cell_does_not_have_a_ship
    cell = Cell.new("B4")

    expected = nil
    actual = cell.ship
    assert_equal expected, actual
  end

  def test_cell_starts_empty
    cell = Cell.new("B4")

    expected = true
    actual = cell.empty?
    assert_equal expected, actual
  end

#### Add a ship
  def test_add_a_ship
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)

    expected = Ship
    actual = cruiser
    assert_instance_of expected, actual
  end

#### Place ship
  def test_cell_has_a_ship #? <- reading instructions as well as I can
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)

    expected = Ship
    actual = cell.ship
    assert_instance_of expected, actual
  end

  def test_is_cell_empty_after_placing_ship
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)

    expected = false
    actual = cell.empty?
    assert_equal expected, actual
  end

##########
#### Additionally, a cell knows when it has been fired upon. When it is fired upon, the cell’s ship should be damaged if it has one:

  def test_whether_a_cell_has_been_fired_upon
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)

    expected = false
    actual = cell.fired_upon?
    assert_equal expected, actual
  end

  def test_ship_health_after_cell_is_fired_upon
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)
    cell.fire_upon

    expected = 2
    actual = cell.ship.health
    assert_equal expected, actual
  end

  def test_whether_cell_has_now_been_fired_upon
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)
    cell.fire_upon

    expected = true
    actual = cell.fired_upon?
    assert_equal expected, actual
  end

#########
#### Finally, a Cell will have a method called render which returns
# a String representation of the Cell for when we need to print the
# board. A cell can potentially be rendered as:

#### ”.” if the cell has not been fired upon.
#### “M” if the cell has been fired upon and it does not contain a
# ship (the shot was a miss).
#### “H” if the cell has been fired upon and it contains a ship
# (the shot was a hit).
#### “X” if the cell has been fired upon and its ship has been sunk.
#### Additionally, we will include an optional boolean argument to indicate if we want
 # to reveal a ship in the cell even if it has not been fired upon. This should render a cell that has not been fired upon and contains a ship as an “S”. This will be useful for showing the user where they placed their ships and for debugging.

  def test_cell_1_exists
    cell_1 = Cell.new("B4")

    expected = Cell
    actual = cell_1
    assert_instance_of expected, actual
  end

  def test_cell_1_renders_period_until_fired_upon
    cell_1 = Cell.new("B4")

    expected = "."
    actual = cell_1.render
    assert_equal expected, actual
  end

  def test_cell_1_renders_M_after_fired_upon_but_contains_no_ship
    cell_1 = Cell.new("B4")
    cell_1.fire_upon

    expected = "M"
    actual = cell_1.render
    assert_equal expected, actual
  end

  def test_cell_2_exists
    cell_2 = Cell.new("C3")

    expected = Cell
    actual = cell_2
    assert_instance_of expected, actual
  end

  def test_cell_2_renders_period_before_fired_upon
    cell_2 = Cell.new("C3")
    cruiser = Ship.new("Cruiser", 3)
    cell_2.place_ship(cruiser)

    expected = "."
    actual = cell_2.render
    assert_equal expected, actual
  end

#### Allow cell to render "S" when not fired upon and does contain a ship.
#### Will be useful for showing user where they placed their ships and debugging.
  def test_cell_2_renders_S_when_not_fired_upon_but_contains_a_ship

    cell_2 = Cell.new("C3")
    cruiser = Ship.new("Cruiser", 3)
    cell_2.place_ship(cruiser)
# # Indicate that we want to show a ship with the optional argument
# pry(main)> cell_2.render(true)
# # => "S"
    expected = "S"
    actual = cell_2.render(true)
    assert_equal expected, actual
  end

  def test_cell_2_renders_H_after_fired_upon_and_contains_a_ship
    cell_2 = Cell.new("C3")
    cruiser = Ship.new("Cruiser", 3)
    cell_2.place_ship(cruiser)
    cell_2.fire_upon

    expected = "H"
    actual = cell_2.render
    assert_equal expected, actual
  end

  def test_cruiser_sunk_after_fired_upon_once
    skip
    cell_2 = Cell.new("C3")
    cruiser = Ship.new("Cruiser", 3)
    cell_2.place_ship(cruiser)
    cell_2.fire_upon

    expected = false
    actual = cruiser.sunk?
    assert_equal expected, actual
  end

  def test_cruiser_sunk_after_fired_upon_once_and_hit_twice #? <- may need to clarify this sequence with instructors, I've double checked it.
    skip
    cell_2 = Cell.new("C3")
    cruiser = Ship.new("Cruiser", 3)
    cell_2.place_ship(cruiser)
    cell_2.fire_upon
    cruiser.hit
    cruiser.hit

    expected = true
    actual = cruiser.sunk?
    assert_equal expected, actual
  end

  def test_cell_2_renders_X_after_fired_upon_and_ship_sunk
    skip
    cell_2 = Cell.new("C3")
    cruiser = Ship.new("Cruiser", 3)
    cell_2.place_ship(cruiser)
    cell_2.fire_upon
    cruiser.hit
    cruiser.hit

    expected = "X"
    actual = cell_2.render
    assert_equal expected, actual
  end

end
