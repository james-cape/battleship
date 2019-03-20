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
    # if @ship != nil
    #   @empty = false
    # end
    # @empty
  end

  def fired_upon?
    @fired_upon
  end

  def fire_upon
    @fired_upon = true
    if @empty == true
      @render = "M"
    else
      @ship.hit
      @render = "H"
    end

    def render(argument = false)
      if argument == true
        @render = "S"
      else
        @render
      end
    end
  end





end









#
