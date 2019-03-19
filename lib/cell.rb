require './lib/ship'

class Cell
  attr_reader :coordinate, :empty, :ship_on_cell, :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @empty = true

  end

  def place_ship(ship)
    @ship = ship
  end

  def empty?
    
binding.pry
  end



end









#
