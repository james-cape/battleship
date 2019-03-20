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
    if @fired_upon == true && @empty == true
      "M"
      # binding.pry
    elsif @fired_upon == true && @ship.sunk?
      "X"
    elsif @fired_upon == true
      "H"
    elsif @fired_upon == false && render == true
      "S"
    else @fired_upon == false
    "."
    end
  end








# if fired upon
#   fired upon = true
#   if cell empty
#     render "M"
#   else if cell not empty
#     hit ship and take off 1 health
#     if ship health = 0
#       then ship is sunk
#       render "x"
#     else
#       ship is hit but not sunk
#       render "h"

  # def fire_upon
  #   @fired_upon = true
  #
  #
  #
  #
  #   if @empty == true
  #     @render = "M"
  #   elsif @ship.sunk?
  #     @render = "X"
  #   else
  #     @ship.hit
  #     @render = "H"
  #   end
  # end
  #
  #
  # def render(argument = false)
  #   if argument == true
  #     @render = "S"
  #   else
  #     @render
  #   end
  # end


end









#
