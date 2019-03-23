require './lib/ship'

class Cell
  attr_reader :coordinate, :empty, :ship, :fired_upon, :reveal

  def initialize(coordinate, reveal = ".")
    @coordinate = coordinate
    @ship = nil
    @empty = true
    @fired_upon = false
    @reveal = reveal
  end

  def place_ship(ship)
    @ship = ship
    @empty = false
  end

  def empty?
    @empty
  end

  def fired_upon?
    @fired_upon
  end

  def fire_upon
    @fired_upon = true
    if @empty == false
      ship.hit
    end
  end

  def render(reveal = false)
    if         reveal == true && @empty == false
      "S"
    elsif @fired_upon == true && @empty == true
      "M"
    elsif @fired_upon == true && @ship.sunk?
      "X"
    elsif @fired_upon == true
      "H"
    else  @fired_upon == false
      "."
    end

  end

end
