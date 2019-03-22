require './lib/ship'

class Cell
  attr_reader :coordinate, :empty, :ship, :fired_upon, :render

  def initialize(coordinate, render = ".")
    @coordinate = coordinate
    @ship = nil
    @empty = true
    @fired_upon = false
    @render = render
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

  def render(render = false)
    if    render == true  &&      @empty == false
      "S"
    elsif render == false && @fired_upon == true && @empty == true
      "M"
    elsif render == false && @fired_upon == true && @ship.sunk?
      "X"
    elsif render == false && @fired_upon == true
      "H"
    else  render == false && @fired_upon == false
    "."
    end

  end

end
